#! /bin/bash -ex

CORE_CONFIG="$1"
TARGET_DIR=$(dirname "$0")/include
rm -rf "$TARGET_DIR"/arch
mkdir -p "$TARGET_DIR/arch"

if [ -d "$CORE_CONFIG" ] ; then
  cp -a "$CORE_CONFIG/xtensa-elf/arch/include" "$TARGET_DIR/arch"
else
  CORE_DIR=$(tar -tf "$CORE_CONFIG" | head -n1 | cut -d '/' -f1-2)
  tar -xf "$CORE_CONFIG" --strip-components=3 -C "$TARGET_DIR" "$CORE_DIR/xtensa-elf/arch/include"
fi
