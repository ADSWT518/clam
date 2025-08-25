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
sudo apt install clang-14 llvm-14
```

This will install Clang & LLVM 14.0.0.

### Arch Linux

Clang & LLVM 14.0.0 prebuilt: https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz

Extract to `${DIR}/clang+llvm-14.0.0`, here `${DIR}` needs to be replaced by an absolute path.

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
export DIR=
cmake \
  -DCMAKE_C_COMPILER=${DIR}/clang+llvm-14.0.0/bin/clang \
  -DCMAKE_CXX_COMPILER=${DIR}/clang+llvm-14.0.0/bin/clang++ \
  -DLLVM_DIR=${DIR}/clang+llvm-14.0.0/lib/cmake/llvm \
  -DCMAKE_CXX_FLAGS="-include cstdint" \
  -DGMP_INCLUDE_DIR=/usr/include \
  -DGMP_LIB=/usr/lib/libgmp.so \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
  ../
cmake --build . -- -j$(nproc)
```