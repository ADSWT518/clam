# How to build

## Step 1. Install dependencies

boost, gmp, mpfr, flint

### Ubuntu

```shell
sudo apt install libboost-all-dev libboost-program-options-dev libgmp-dev libmpfr-dev libflint-dev
```

### Arch Linux

```shell
sudo pacman -S boost gmp mpfr flint
```

## Step 2. Download required GCC and Clang & LLVM

### Ubuntu

```shell
sudo apt install build-essential clang-14 llvm-14
```

This will install GCC 11.4.0 and Clang & LLVM 14.0.0.

### Arch Linux

GCC 11.5.0 prebuilt:
* https://sourceforge.net/projects/fabiololix-os-archive/files/Packages/gcc11-11.5.0-1-x86_64.pkg.tar.zst/download
* https://sourceforge.net/projects/fabiololix-os-archive/files/Packages/gcc11-libs-11.5.0-1-x86_64.pkg.tar.zst/download

```shell
sudo pacman -U gcc11-11.5.0-1-x86_64.pkg.tar.zst gcc11-libs-11.5.0-1-x86_64.pkg.tar.zst
```

Clang & LLVM 14.0.0 prebuilt: https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz

Extract to `$(DIR)/clang+llvm-14.0.0`, here `$(DIR)` needs to be replaced by an absolute path.

## Step 3. Enter the directory, fetch git submodules

```shell
git submodule init
git submodule update
```

## Step 4. Build

### Ubuntu

```shell
mkdir build && cd build
cmake ..
cmake --build . -- -j$(nproc)
```

### Arch Linux

```shell
mkdir build && cd build

cmake \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DCMAKE_C_COMPILER=gcc-11 \
  -DCMAKE_CXX_COMPILER=g++-11 \
  -DLLVM_DIR=$(DIR)/clang+llvm-14.0.0/lib/cmake/llvm \
  -DGMP_INCLUDE_DIR=/usr/include \
  -DGMP_LIB=/usr/lib/libgmp.so \
  ../

cmake --build . -- -j$(nproc)
```