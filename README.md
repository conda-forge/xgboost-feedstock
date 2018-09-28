About xgboost
=============

Home: https://github.com/dmlc/xgboost

Package license: Apache-2.0

Feedstock license: BSD 3-Clause

Summary: Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library, for
Python, R, Java, Scala, C++ and more. Runs on single machine, Hadoop, Spark, Flink
and DataFlow


XGBoost is an optimized distributed gradient boosting library designed to be highly efficient,
flexible and portable. It implements machine learning algorithms under the Gradient Boosting
framework. XGBoost provides a parallel tree boosting (also known as GBDT, GBM) that solve many
data science problems in a fast and accurate way. The same code runs on major distributed
environment (Hadoop, SGE, MPI) and can solve problems beyond billions of examples.


Current build status
====================

[![Linux](https://img.shields.io/circleci/project/github/conda-forge/xgboost-feedstock/master.svg?label=Linux)](https://circleci.com/gh/conda-forge/xgboost-feedstock)
[![OSX](https://img.shields.io/travis/conda-forge/xgboost-feedstock/master.svg?label=macOS)](https://travis-ci.org/conda-forge/xgboost-feedstock)
[![Windows](https://img.shields.io/appveyor/ci/conda-forge/xgboost-feedstock/master.svg?label=Windows)](https://ci.appveyor.com/project/conda-forge/xgboost-feedstock/branch/master)

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-_py--xgboost--mutex-green.svg)](https://anaconda.org/conda-forge/_py-xgboost-mutex) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/_py-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_py-xgboost-mutex) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/_py-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_py-xgboost-mutex) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/_py-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_py-xgboost-mutex) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-_r--xgboost--mutex-green.svg)](https://anaconda.org/conda-forge/_r-xgboost-mutex) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/_r-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_r-xgboost-mutex) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/_r-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_r-xgboost-mutex) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/_r-xgboost-mutex.svg)](https://anaconda.org/conda-forge/_r-xgboost-mutex) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-libxgboost-green.svg)](https://anaconda.org/conda-forge/libxgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/libxgboost.svg)](https://anaconda.org/conda-forge/libxgboost) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/libxgboost.svg)](https://anaconda.org/conda-forge/libxgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/libxgboost.svg)](https://anaconda.org/conda-forge/libxgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-py--xgboost-green.svg)](https://anaconda.org/conda-forge/py-xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/py-xgboost.svg)](https://anaconda.org/conda-forge/py-xgboost) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/py-xgboost.svg)](https://anaconda.org/conda-forge/py-xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/py-xgboost.svg)](https://anaconda.org/conda-forge/py-xgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-py--xgboost--cpu-green.svg)](https://anaconda.org/conda-forge/py-xgboost-cpu) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/py-xgboost-cpu.svg)](https://anaconda.org/conda-forge/py-xgboost-cpu) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/py-xgboost-cpu.svg)](https://anaconda.org/conda-forge/py-xgboost-cpu) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/py-xgboost-cpu.svg)](https://anaconda.org/conda-forge/py-xgboost-cpu) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-r--xgboost-green.svg)](https://anaconda.org/conda-forge/r-xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/r-xgboost.svg)](https://anaconda.org/conda-forge/r-xgboost) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/r-xgboost.svg)](https://anaconda.org/conda-forge/r-xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/r-xgboost.svg)](https://anaconda.org/conda-forge/r-xgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-r--xgboost--cpu-green.svg)](https://anaconda.org/conda-forge/r-xgboost-cpu) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/r-xgboost-cpu.svg)](https://anaconda.org/conda-forge/r-xgboost-cpu) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/r-xgboost-cpu.svg)](https://anaconda.org/conda-forge/r-xgboost-cpu) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/r-xgboost-cpu.svg)](https://anaconda.org/conda-forge/r-xgboost-cpu) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-xgboost-green.svg)](https://anaconda.org/conda-forge/xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/xgboost.svg)](https://anaconda.org/conda-forge/xgboost) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/xgboost.svg)](https://anaconda.org/conda-forge/xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/xgboost.svg)](https://anaconda.org/conda-forge/xgboost) |

Installing xgboost
==================

Installing `xgboost` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
```

Once the `conda-forge` channel has been enabled, `_py-xgboost-mutex, _r-xgboost-mutex, libxgboost, py-xgboost, py-xgboost-cpu, r-xgboost, r-xgboost-cpu, xgboost` can be installed with:

```
conda install _py-xgboost-mutex _r-xgboost-mutex libxgboost py-xgboost py-xgboost-cpu r-xgboost r-xgboost-cpu xgboost
```

It is possible to list all of the versions of `_py-xgboost-mutex` available on your platform with:

```
conda search _py-xgboost-mutex --channel conda-forge
```


About conda-forge
=================

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/)
and [TravisCI](https://travis-ci.org/) it is possible to build and upload installable
packages to the [conda-forge](https://anaconda.org/conda-forge)
[Anaconda-Cloud](https://anaconda.org/) channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating xgboost-feedstock
==========================

If you would like to improve the xgboost recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/xgboost-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string)
   back to 0.
