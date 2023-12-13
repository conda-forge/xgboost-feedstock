About xgboost-feedstock
=======================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/xgboost-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/dmlc/xgboost

Package license: Apache-2.0

Summary: Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library, for
Python, R, Java, Scala, C++ and more. Runs on single machine, Hadoop, Spark, Flink
and DataFlow


Development: https://github.com/dmlc/xgboost/

Documentation: https://xgboost.readthedocs.io/

XGBoost is an optimized distributed gradient boosting library designed to be highly efficient,
flexible and portable. It implements machine learning algorithms under the Gradient Boosting
framework. XGBoost provides a parallel tree boosting (also known as GBDT, GBM) that solve many
data science problems in a fast and accurate way. The same code runs on major distributed
environment (Hadoop, SGE, MPI) and can solve problems beyond billions of examples.


Current build status
====================


<table>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-libxgboost-green.svg)](https://anaconda.org/rapidsai-nightly/libxgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/rapidsai-nightly/libxgboost.svg)](https://anaconda.org/rapidsai-nightly/libxgboost) | [![Conda Version](https://img.shields.io/conda/vn/rapidsai-nightly/libxgboost.svg)](https://anaconda.org/rapidsai-nightly/libxgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/rapidsai-nightly/libxgboost.svg)](https://anaconda.org/rapidsai-nightly/libxgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-py--xgboost-green.svg)](https://anaconda.org/rapidsai-nightly/py-xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/rapidsai-nightly/py-xgboost.svg)](https://anaconda.org/rapidsai-nightly/py-xgboost) | [![Conda Version](https://img.shields.io/conda/vn/rapidsai-nightly/py-xgboost.svg)](https://anaconda.org/rapidsai-nightly/py-xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/rapidsai-nightly/py-xgboost.svg)](https://anaconda.org/rapidsai-nightly/py-xgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-r--xgboost-green.svg)](https://anaconda.org/rapidsai-nightly/r-xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/rapidsai-nightly/r-xgboost.svg)](https://anaconda.org/rapidsai-nightly/r-xgboost) | [![Conda Version](https://img.shields.io/conda/vn/rapidsai-nightly/r-xgboost.svg)](https://anaconda.org/rapidsai-nightly/r-xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/rapidsai-nightly/r-xgboost.svg)](https://anaconda.org/rapidsai-nightly/r-xgboost) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-xgboost-green.svg)](https://anaconda.org/rapidsai-nightly/xgboost) | [![Conda Downloads](https://img.shields.io/conda/dn/rapidsai-nightly/xgboost.svg)](https://anaconda.org/rapidsai-nightly/xgboost) | [![Conda Version](https://img.shields.io/conda/vn/rapidsai-nightly/xgboost.svg)](https://anaconda.org/rapidsai-nightly/xgboost) | [![Conda Platforms](https://img.shields.io/conda/pn/rapidsai-nightly/xgboost.svg)](https://anaconda.org/rapidsai-nightly/xgboost) |

Installing xgboost
==================

Installing `xgboost` from the `rapidsai-nightly` channel can be achieved by adding `rapidsai-nightly` to your channels with:

```
conda config --add channels rapidsai-nightly
conda config --set channel_priority strict
```

Once the `rapidsai-nightly` channel has been enabled, `libxgboost, py-xgboost, r-xgboost, xgboost` can be installed with `conda`:

```
conda install libxgboost py-xgboost r-xgboost xgboost
```

or with `mamba`:

```
mamba install libxgboost py-xgboost r-xgboost xgboost
```

It is possible to list all of the versions of `libxgboost` available on your platform with `conda`:

```
conda search libxgboost --channel rapidsai-nightly
```

or with `mamba`:

```
mamba search libxgboost --channel rapidsai-nightly
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search libxgboost --channel rapidsai-nightly

# List packages depending on `libxgboost`:
mamba repoquery whoneeds libxgboost --channel rapidsai-nightly

# List dependencies of `libxgboost`:
mamba repoquery depends libxgboost --channel rapidsai-nightly
```




Updating xgboost-feedstock
==========================

If you would like to improve the xgboost recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`rapidsai-nightly` channel, whereupon the built conda packages will be available for
everybody to install and use from the `rapidsai-nightly` channel.
Note that all branches in the conda-forge/xgboost-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@aldanor](https://github.com/aldanor/)
* [@fhoehle](https://github.com/fhoehle/)
* [@hcho3](https://github.com/hcho3/)
* [@jakirkham](https://github.com/jakirkham/)
* [@ksangeek](https://github.com/ksangeek/)
* [@mfansler](https://github.com/mfansler/)
* [@xhochy](https://github.com/xhochy/)

