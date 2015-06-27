One-Time Pad Key-Exchange
===============================================================================

This is the source code of the paper:

```bibtex
@inproceedings{otpkx,
author={Daniel Bosk and
    Martin Kjellqvist and
    Sonja Buchegger},
title={One-Time Pad Key-Exchange},
editor={Sonja Buchegger, Mads Dam},
booktitle={NordSec},
}
```

File Structure
-------------------------------------------------------------------------------

The `nfckx-app` submodule contains the Android app used for generating and 
exchanging key-material.  See that submodule for more details.

The paper's main source code is in the root directory.  There is a `Makefile` 
which will make compilation easier.  This makefile depends on the `makefiles` 
submodule, so make sure to do a `git submodule update --recursive --init` 
first.

The Enron dataset will automatically be downloaded and extracted, and the 
statistical analysis run (through PythonTeX), when the paper is compiled.  So 
by compiling the paper you automatically reproduce the data analysis in the 
paper.
