.PHONY: all
all: otpkx.pdf

otpkx.pdf: otpkx.tex otpkx-content.tex
otpkx.pdf: libbib.sty
otpkx.pdf: llncs biblatex-lncs latexmkrc
otpkx.pdf: otrmsg.bib surveillance.bib crypto.bib
otpkx.pdf: otpkx.bib nfc.bib
otpkx.pdf: enron-sent.sqlite3
otpkx.pdf: msc.sty

msc.sty:
	wget -O $@ http://satoss.uni.lu/software/mscpackage/development/msc.sty

enron-dataset: enron-dataset.tar.gz
	pax -rz -f $^ -s "|^maildir/|$@/|"

enron-dataset.tar.gz:
	wget -O $@ https://www.cs.cmu.edu/~./enron/enron_mail_20150507.tar.gz

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
	${RM} msc.sty
	${RM} enron.sqlite3 enron-sent.sqlite3

### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
INCLUDE_LIBBIB=libbib
include ${INCLUDE_LIBBIB}/libbib.mk
