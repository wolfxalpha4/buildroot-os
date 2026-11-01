#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

ROOTFS=$(ls -1 rootfs.ext* 2>/dev/null | head -n 1)
KERNEL="bzImage"

if [ ! -f "$KERNEL" ] || [ -z "$ROOTFS" ]; then
    echo "================================================================="
    echo " ❌ Missing OS Image Files!"
    echo "================================================================="
    echo " 1. Download the build artifact ('custom-buildroot-os.zip') from"
    echo "    your GitHub Actions run."
    echo " 2. Extract 'bzImage' and 'rootfs.ext4' into this directory: $DIR"
    echo " 3. Run this script again: ./run-local.sh"
    echo "================================================================="
    exit 1
fi

echo "================================================================="
echo " 🚀 Booting Custom Buildroot OS..."
echo " * Kernel:     $KERNEL"
echo " * Filesystem: $ROOTFS"
echo " * SSH:        localhost:2222 (ssh root@localhost -p 2222)"
echo " * Window:     Dropping directly into graphical desktop with Doom!"
echo "================================================================="

# Detect audio device support in QEMU (kernel uses CONFIG_SND_HDA_INTEL)
AUDIO_FLAG=""
if qemu-system-x86_64 -audiodev help 2>&1 | grep -q 'pa'; then
    AUDIO_FLAG="-audiodev pa,id=snd0 -device intel-hda -device hda-duplex,audiodev=snd0"
elif qemu-system-x86_64 -audiodev help 2>&1 | grep -q 'alsa'; then
    AUDIO_FLAG="-audiodev alsa,id=snd0 -device intel-hda -device hda-duplex,audiodev=snd0"
fi

qemu-system-x86_64 \
  -M pc \
  -m 1024M \
  -smp 2 \
  -kernel "$KERNEL" \
  -drive file="$ROOTFS",if=virtio,format=raw \
  -append "root=/dev/vda rw console=tty1" \
  -vga std \
  -display gtk \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  $AUDIO_FLAG
