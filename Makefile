PUB_SITES?=			csc sys
#PUB_FILES= 			deniability.pdf
PUB_FILES+= 		otpkx.pdf
PUB_CATEGORY= 		

PUB_SERVER-csc= 	u-shell.csc.kth.se
PUB_METHOD-csc= 	ssh
PUB_DIR-csc= 		~/public_html

PUB_SERVER-sys= 	sftp.sys.kth.se
PUB_METHOD-sys= 	ssh
PUB_DIR-sys= 		~/public_html

USE_LATEXMK= 		yes
USE_BIBLATEX= 		yes

.PHONY: all
all: otpkx.pdf

deniability.pdf: deniability.tex
deniability.pdf: llncs biblatex-lncs latexmkrc
deniability.pdf: otpkx-content.tex
deniability.pdf: otrmsg-content.tex
deniability.pdf: otrmsg.bib surveillance.bib crypto.bib
deniability.pdf: crypto.acr surveillance.acr stdterm.acr

otpkx.pdf: otpkx.tex otpkx-content.tex
otpkx.pdf: llncs biblatex-lncs latexmkrc
otpkx.pdf: otrmsg.bib surveillance.bib crypto.bib
otpkx.pdf: crypto.acr surveillance.acr stdterm.acr

enron-dataset: enron-dataset.tar.gz
	pax -rz -f $^ -s "|^maildir/|$@/|"

enron-dataset.tar.gz:
	wget -O $@ https://www.cs.cmu.edu/~./enron/enron_mail_20150507.tgz

makefiles libbib:
	git submodule update --init $@

.PHONY: clean-depends
clean-depends:
	${RM} enron-dataset.tar.gz
	${RM} -R enron-dataset

### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/depend.mk
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pub.mk
INCLUDE_LIBBIB=libbib
include ${INCLUDE_LIBBIB}/libbib.mk
