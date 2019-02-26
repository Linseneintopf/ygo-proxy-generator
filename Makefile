

.SILENT:

all: proxies.pdf

proxies.pdf: decklist.txt download-images
	echo 'Generating pdf'
	# TODO: insert user's decklist
	(cd tex; pdflatex proxies.tex) > /dev/null
	mv tex/proxies.pdf .
	echo 'done'

.PHONY: download-images

download-images: decklist.txt scripts/download-images.sh
	echo 'Downloading images'
	./scripts/download-images.sh



####################
# Cleaning Targets #
####################

.PHONY: clean clean-tex clean-vscode

clean: clean-tex clean-vscode
	rm proxies.pdf || true

clean-tex:
	rm tex/proxies.{aux,bbl,blg,log,out,pdf} || true

clean-vscode:
	rm tex/proxies.{fdb_latexmk,fls,synctex.gz} || true

