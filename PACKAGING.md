## Debian Packaging

### .deb

1. Bump version in `CMakeLists.txt` `project` 

2. Create .deb package

```bash
cd jetson_ffmpeg
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cpack -G DEB
```

3. Rename packge file to include distribtuion name.

E.g. for Ubuntu 20.04 focal

```bash
# for Ubuntu 18.04 Bionic
# mv mv ../_packages/extend-nvmpi_1.0.0_arm64.deb ../_packages/extend-nvmpi_1.0.0_bionic_arm64.deb
# for Ubuntu 20.04 Focal
mv ../_packages/extend-nvmpi_1.0.0_arm64.deb ../_packages/extend-nvmpi_1.0.0_focal_arm64.deb
``` 

4. Install/remove .deb package

```bash
# install (here 1.0.0 version)
sudo apt install ./extend-nvmpi_1.0.0_focal_arm64.deb
# remove
# sudo apt remove extend-nvmpi
```

