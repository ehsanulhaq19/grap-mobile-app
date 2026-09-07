#!/usr/bin/env python3
"""Generate GRAP launcher PNGs without third-party dependencies."""

import struct
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PRIMARY = (107, 56, 212)
TERTIARY = (161, 46, 112)


def _chunk(tag: bytes, data: bytes) -> bytes:
    return (
        struct.pack(">I", len(data))
        + tag
        + data
        + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)
    )


def write_png(path, width, height, pixels):
    raw = bytearray()
    for y in range(height):
        raw.append(0)
        for x in range(width):
            raw.extend(pixels[y * width + x])
    compressed = zlib.compress(bytes(raw), 9)
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 6, 0, 0, 0)
    png = b"\x89PNG\r\n\x1a\n" + _chunk(b"IHDR", ihdr) + _chunk(b"IDAT", compressed) + _chunk(b"IEND", b"")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(png)


def lerp(a, b, t):
    return int(a + (b - a) * t)


def rounded_rect_mask(size, radius):
    mask = [[False] * size for _ in range(size)]
    r = radius
    for y in range(size):
        for x in range(size):
            inside = True
            if x < r and y < r and (x - r) ** 2 + (y - r) ** 2 > r * r:
                inside = False
            if x >= size - r and y < r and (x - (size - r)) ** 2 + (y - r) ** 2 > r * r:
                inside = False
            if x < r and y >= size - r and (x - r) ** 2 + (y - (size - r)) ** 2 > r * r:
                inside = False
            if x >= size - r and y >= size - r and (x - (size - r)) ** 2 + (y - (size - r)) ** 2 > r * r:
                inside = False
            mask[y][x] = inside
    return mask


def draw_g_bitmap(size):
    canvas = [[False] * size for _ in range(size)]
    cx = size // 2
    cy = size // 2
    outer = int(size * 0.30)
    inner = int(size * 0.20)
    bar_h = max(size // 10, 2)
    for y in range(size):
        for x in range(size):
            dx = x - cx
            dy = y - cy
            dist = (dx * dx + dy * dy) ** 0.5
            if outer - 2 <= dist <= outer:
                if not (dx > 0 and abs(dy) < bar_h):
                    canvas[y][x] = True
            if inner <= dist <= outer and dx <= 0 and dy >= -bar_h:
                canvas[y][x] = True
            if dx > 0 and abs(dy) <= bar_h and dx <= outer:
                canvas[y][x] = True
    return canvas


def create_icon(size):
    radius = max(int(size * 0.32), 1)
    mask = rounded_rect_mask(size, radius)
    letter = draw_g_bitmap(size)
    pixels = []
    for y in range(size):
        t = y / max(size - 1, 1)
        bg = (
            lerp(PRIMARY[0], TERTIARY[0], t),
            lerp(PRIMARY[1], TERTIARY[1], t),
            lerp(PRIMARY[2], TERTIARY[2], t),
        )
        for x in range(size):
            if not mask[y][x]:
                pixels.append((0, 0, 0, 0))
            elif letter[y][x]:
                pixels.append((255, 255, 255, 255))
            else:
                pixels.append((*bg, 255))
    return pixels


def main():
    android = {
        "mipmap-mdpi": 48,
        "mipmap-hdpi": 72,
        "mipmap-xhdpi": 96,
        "mipmap-xxhdpi": 144,
        "mipmap-xxxhdpi": 192,
    }
    for folder, px in android.items():
        out = ROOT / "android/app/src/main/res" / folder / "ic_launcher.png"
        write_png(out, px, px, create_icon(px))

    ios_icons = {
        "Icon-App-20x20@1x.png": 20,
        "Icon-App-20x20@2x.png": 40,
        "Icon-App-20x20@3x.png": 60,
        "Icon-App-29x29@1x.png": 29,
        "Icon-App-29x29@2x.png": 58,
        "Icon-App-29x29@3x.png": 87,
        "Icon-App-40x40@1x.png": 40,
        "Icon-App-40x40@2x.png": 80,
        "Icon-App-40x40@3x.png": 120,
        "Icon-App-60x60@2x.png": 120,
        "Icon-App-60x60@3x.png": 180,
        "Icon-App-76x76@1x.png": 76,
        "Icon-App-76x76@2x.png": 152,
        "Icon-App-83.5x83.5@2x.png": 167,
        "Icon-App-1024x1024@1x.png": 1024,
    }
    ios_dir = ROOT / "ios/Runner/Assets.xcassets/AppIcon.appiconset"
    for name, px in ios_icons.items():
        write_png(ios_dir / name, px, px, create_icon(px))

    launch_dir = ROOT / "ios/Runner/Assets.xcassets/LaunchImage.imageset"
    splash_sizes = {
        "LaunchImage.png": 375,
        "LaunchImage@2x.png": 750,
        "LaunchImage@3x.png": 1125,
    }
    for name, width in splash_sizes.items():
        height = int(width * 16 / 9)
        pixels = [(248, 249, 255, 255)] * (width * height)
        icon_px = max(width // 5, 48)
        icon = create_icon(icon_px)
        offset_x = (width - icon_px) // 2
        offset_y = int(height * 0.34)
        for y in range(icon_px):
            for x in range(icon_px):
                alpha = icon[y * icon_px + x][3]
                if alpha:
                    idx = (offset_y + y) * width + (offset_x + x)
                    pixels[idx] = icon[y * icon_px + x]
        write_png(launch_dir / name, width, height, pixels)

    print("Generated GRAP launcher PNGs")


if __name__ == "__main__":
    main()
