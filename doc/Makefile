
pdf: 129.pdf

%.pdf:   %.dvi
	@dvipdfm $<

%.dvi: %.tex
	@latex $<

clean:
	rm 129.pdf a.pdf 129.dvi 129.log 129.nav 129.out 129.aux 129.snm *.bak 129.toc
.PHONY: clean
