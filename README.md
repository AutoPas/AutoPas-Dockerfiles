# AutoPas-Dockerfiles
This repository provides a variety of Dockerfiles for the [AutoPas](https://github.com/AutoPas/AutoPas) library.
They are sorted in directories according to the task they are meant to fulfill:
## buildenv
Files in the buildenv directory are meant to build AutoPas.
You can build AutoPas without installing any dependencies simply by using the generated images.

The generated images are used by Jenkins to test the AutoPas library.

### code-coverage
This file is used for code coverage purposes. You can build AutoPas in a code-coverage version using the file. It includes:
* python
* gcc
* cmake
* ninja
* lcov + gcov
* gcovr
