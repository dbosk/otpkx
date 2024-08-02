One-Time Pad Key-Exchange for Deniability
===============================================================================

This is the source code of the paper:

```bibtex
@inproceedings{OTPKX,
  title={Towards Perfectly Secure and Deniable Communication Using an NFC-Based 
    Key-Exchange Scheme},
  author={Bosk, Daniel and Kjellqvist, Martin and Buchegger, Sonja},
  booktitle={Secure IT Systems},
  editor={Buchegger, Sonja and Dam, Mads},
  series={Lecture Notes in Computer Science},
  volume={9417},
  pages={72--87},
  year={2015},
  publisher={Springer International Publishing},
  isbn={978-3-319-26501-8},
  doi={10.1007/978-3-319-26502-5_6},
  URL={http://dx.doi.org/10.1007/978-3-319-26502-5_6},
  keywords={Deniability; Deniable encryption; Authenticated encryption; Perfect 
    secrecy; Off-the-record; Key-exchange; Nearfield communication; 
    Surveillance},
}
```

You can find the camera-ready version of the [paper][1] and the [slides][2] 
under releases.  The published version of the paper is available from 
[SpringerLink][3].

[1]: https://github.com/dbosk/otpkx/releases/download/v1.1/otpkx.pdf
[2]: https://github.com/dbosk/otpkx/releases/download/v1.1/otpkx-slides.pdf
[3]: http://link.springer.com/chapter/10.1007/978-3-319-26502-5_6


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
paper.  Have fun and please let me know if you find anything interesting!
