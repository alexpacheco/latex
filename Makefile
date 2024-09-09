filename=MAIN_LATEX_FILE_NAME_WITHOUT_.tex

pdf: ps
	ps2pdf ${filename}.ps

ps: dvi
	dvips -landscaperotate ${filename}.dvi

dvi:
	latex ${filename}
	bibtex ${filename}||true
	latex ${filename}
	latex ${filename}

read:
	open ${filename}.pdf &

aread:
	acroread ${filename}.pdf

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,bm,tmp,toc,vrb}
