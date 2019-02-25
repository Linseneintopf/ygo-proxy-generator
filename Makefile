

all: proxies.pdf

proxies.pdf: decklist.txt download-images
	# TODO: insert user's decklist
	(cd tex; pdflatex proxies.tex)
	mv tex/proxies.pdf .

.PHONY: download-images

download-images: decklist.txt
	# TODO


.PHONY: clean clean-tex clean-vscode

clean: clean-tex clean-vscode
	rm proxies.pdf || true

clean-tex:
	rm tex/proxies.{aux,bbl,blg,log,out,pdf} || true

clean-vscode:
	rm tex/proxies.{fdb_latexmk,fls,synctex.gz} || true

