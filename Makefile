

.SILENT:

all: proxies.pdf

proxies.pdf: download-images tex/cards.tex tex/proxies.tex
	echo 'Generating pdf'
	(cd tex; pdflatex proxies.tex) > /dev/null
	mv tex/proxies.pdf .
	echo 'done'

.PHONY: download-images

download-images: decklist.txt scripts/download_images.sh scripts/read_decklist.sh
	echo 'Downloading images'
	./scripts/download_images.sh

tex/cards.tex: decklist.txt scripts/generate_cards_tex.sh scripts/read_decklist.sh
	./scripts/generate_cards_tex.sh



####################
# Cleaning Targets #
####################

.PHONY: clean clean-tex clean-vscode

clean: clean-tex clean-vscode
	rm proxies.pdf tex/cards.tex 2>/dev/null || true

clean-tex:
	rm tex/proxies.{aux,bbl,blg,log,out,pdf} 2>/dev/null || true

clean-vscode:
	rm tex/proxies.{fdb_latexmk,fls,synctex.gz} 2>/dev/null || true

