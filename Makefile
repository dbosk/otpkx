.PHONY: all
all: otpkx-paper.pdf otpkx-slides.pdf

OTPKX_DEPENDS= 		otpkx-preamble.tex otpkx-content.tex
OTPKX_DEPENDS+= 	libbib.sty
OTPKX_DEPENDS+= 	latexmkrc
OTPKX_DEPENDS+= 	otrmsg.bib surveillance.bib crypto.bib
OTPKX_DEPENDS+= 	otpkx.bib nfc.bib
OTPKX_DEPENDS+= 	enron-sent.sqlite3
OTPKX_DEPENDS+= 	msc.sty

otpkx-paper.pdf: otpkx-paper.tex ${OTPKX_DEPENDS} llncs biblatex-lncs
otpkx-slides.pdf: otpkx-slides.tex ${OTPKX_DEPENDS}

msc.sty:
	wget -O $@ http://satoss.uni.lu/software/mscpackage/development/msc.sty

enron-dataset: enron-dataset.tar.gz
	pax -rz -f $^ -s "|^maildir/|$@/|"

enron-dataset.tar.gz:
	wget -O $@ https://www.cs.cmu.edu/~./enron/enron_mail_20150507.tgz

enron.sqlite3: mailstat.py enron-dataset
	[ ! -f $@ ] || ${RM} $@
	./mailstat.py -f $@ -d enron-dataset

enron-sent.sqlite3: mailstat.py enron-dataset
	[ ! -f $@ ] || ${RM} $@
	find enron-dataset -type d | grep "[Ss]ent" | \
		xargs ./mailstat.py -f $@ -d

mailstat/mailstat.py: mailstat
	${MAKE} -C mailstat mailstat.py

mailstat.py: mailstat/mailstat.py
	[ -e $@ ] || ln -s $^ $@
	chmod +x $@

makefiles libbib mailstat:
	git submodule update --init --recursive $@

.PHONY: clean
clean:
	${RM} mailstat.py

.PHONY: clean-depends
clean-depends:
	${RM} enron-dataset.tar.gz
	${RM} -R enron-dataset
	${MAKE} -C mailstat clean

### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
INCLUDE_LIBBIB=libbib
include ${INCLUDE_LIBBIB}/libbib.mk
