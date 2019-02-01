# AutoPas-Dockerfiles
This repository provides a variety of Dockerfiles for the [AutoPas](https://github.com/AutoPas/AutoPas) library.
They are sorted in directories according to the task they are meant to fulfill:

Prebuild docker-images can be found at https://hub.docker.com/r/autopas/

## buildenv
Files in the buildenv directory are meant to build AutoPas.
You can build AutoPas without installing any dependencies simply by using the generated images.

The generated images are used by Jenkins to test the AutoPas library.

### archer
This file is used to check OpenMP data races. It uses the [archer data race detection tool](https://github.com/PRUNERS/archer). The file includes:
* make
* cmake
* ninja
* clang v6.0.0
* archer version 2.0.0 - Stand-alone build with LLVM OpenMP Runtime and ThreadSanitizer OMPT Support
Archer is installed in /usr and is in the path as clang-archer++ and clang-archer

As Archer already sets -fopenmp OpenMP will always be automatically enabled within AutoPas.
**Important**: `export TSAN_OPTIONS="ignore_noninstrumented_modules=1"` might be needed for archer v2.0.0 if you encounter errors in openmp mutexes etc.

### archer-v1.0.0
This file is used to check OpenMP data races. It uses the [archer data race detection tool](https://github.com/PRUNERS/archer). The file includes:
* make
* cmake
* ninja
* clang v4.0
* archer version 1.0.0 - Stand-alone build with LLVM OpenMP Runtime and ThreadSanitizer OMPT Support
Archer is installed in /usr and is in the path as clang-archer++ and clang-archer

As Archer already sets -fopenmp OpenMP will always be automatically enabled within AutoPas.

### clang
This file is used to build the AutoPas library using clang. It contains:
* make
* cmake
* ninja
* clang v6.0
* libomp
* clang-format-6.0

### code-coverage
This file is used for code coverage purposes. You can build AutoPas in a code-coverage version using the file. It includes:
* python
* gcc
* cmake
* ninja
* lcov + gcov
* gcovr

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
* gcc7
* make
* cmake
* ninja
* openmpi

## other uses
Many of the provided Doxygen images / Doxyfiles can be used to build other things. Feel free to grab them and use them for your own purposes.
