# AutoPas-Dockerfiles
This repository provides a variety of Dockerfiles for the [AutoPas](https://github.com/AutoPas/AutoPas) library.
They are sorted in directories according to the task they are meant to fulfill:
## buildenv
Files in the buildenv directory are meant to build AutoPas.
You can build AutoPas without installing any dependencies simply by using the generated images.

The generated images are used by Jenkins to test the AutoPas library.

### archer
This file is used to check OpenMP data races. It uses the [archer data race detection tool](https://github.com/PRUNERS/archer). The file includes:
* make
* cmake
* ninja
* clang v4.0
* archer version 1.0.0 - Stand-alone build with LLVM OpenMP Runtime and ThreadSanitizer OMPT Support
Archer is installed in /usr and is in the path as clang-archer++ and clang-archer

As Archer already sets -fopenmp OpenMP will always be automatically enabled within AutoPas.


### code-coverage
This file is used for code coverage purposes. You can build AutoPas in a code-coverage version using the file. It includes:
* python
* gcc
* cmake
* ninja
* lcov + gcov
* gcovr

### doxygen
This file is used to build the doxygen documentation. It includes:
* make
* cmake
* doxygen
* graphviz 


## other uses
Many of the provided Doxygen images / Doxyfiles can be used to build other things. Feel free to grab them and use them for your own purposes.
