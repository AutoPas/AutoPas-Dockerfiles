# AutoPas-Dockerfiles
This repository provides a variety of Dockerfiles for the [AutoPas](https://github.com/AutoPas/AutoPas) library.
They are sorted in directories according to the task they are meant to fulfill:

Prebuild docker-images can be found at https://hub.docker.com/r/autopas/

## buildenv
Files in the buildenv directory are meant to build AutoPas.
You can build AutoPas without installing any dependencies simply by using the generated images.

The generated images are used by Jenkins to test the AutoPas library.

### archer
This file is used to check OpenMP data races. It uses the [archer data race detection tool](https://github.com/llvm/llvm-project/tree/master/openmp/tools/archer/). The file includes:
* make
* ccache
* cmake
* ninja
* clang
* llvm openmp library (v10) with bundled archer - it is automatically loaded when clang is used as compiler.

**Important**: `export TSAN_OPTIONS="ignore_noninstrumented_modules=1"` is recommended for archer.

### clang
This file is used to build the AutoPas library using clang. It contains:
* make
* ccache
* cmake
* ninja
* clang
* libomp
* clang-format

### code-coverage

This used to be a container for the coverage target but is not used anymore. The coverage target can now be built with the GCC container.

### cuda
This file is used to build the AutoPas library using cuda. It contains:
* make
* cmake
* ninja
* cuda v10.0

### doxygen
This file is used to build the doxygen documentation. It includes:
* make
* cmake
* doxygen
* graphviz

### gcc
This file is used to build the AutoPas library using gcc. It contains:
* gcc
* make
* cmake
* ninja
* mpich
* ccache
* lcov

## other uses
Many of the provided Doxygen images / Doxyfiles can be used to build other things. Feel free to grab them and use them for your own purposes.
