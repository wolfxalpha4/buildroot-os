# Custom Buildroot Retro OS 🎮

A custom, ultra-lightweight Linux distribution built entirely with **Buildroot** on **GitHub Actions Cloud Runners** (sparing your CPU from compiling).

## Features
- **Libc:** Standard GNU C Library (`glibc`) — *no musl compatibility headaches*.
- **Desktop:** Drops automatically into a lightweight retro window manager (**Fluxbox**) with taskbar, start menu, and clock.
- **Games:** Pre-installed **Chocolate Doom** with official shareware `DOOM1.WAD` and audio.
- **SSH:** Pre-installed `dropbear` SSH server.
- **Package Manager:** Pre-installed `opkg`.
- **Cloud Built:** 100% compiled on GitHub's free cloud infrastructure.

---

## How to Build in the Cloud

### 1. Repository
Repository: `https://github.com/wolfxalpha4/buildroot-os`

### 2. GitHub Actions Does the Work
1. Go to your repository on GitHub: https://github.com/wolfxalpha4/buildroot-os
2. Click on the **Actions** tab.
3. You will see the **"Build Custom Buildroot OS"** workflow running on a fast cloud machine.
4. Once completed, scroll down to the bottom of the workflow page to **Artifacts** and download **`custom-buildroot-os.zip`**.

---

## How to Run It

1. Unzip `custom-buildroot-os.zip` into this folder (it contains `bzImage` and `rootfs.ext4`).
2. Run the launcher script:
```bash
./run-local.sh
```

A graphical window will pop up running your custom OS.
- Right-click anywhere on the desktop wallpaper to open the application menu.
- Click **Games -> Chocolate Doom** to rip and tear!
- Connect via SSH anytime from another terminal:
  ```bash
  ssh root@localhost -p 2222
  ```
