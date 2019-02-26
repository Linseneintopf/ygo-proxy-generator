

.SILENT:

all: proxies.pdf

proxies.pdf: download-images tex/cards.tex tex/proxies.tex
	echo 'Generating pdf'
	# TODO: insert user's decklist
	(cd tex; pdflatex proxies.tex) > /dev/null
	mv tex/proxies.pdf .
	echo 'done'

.PHONY: download-images

download-images: decklist.txt scripts/download-images.sh
	echo 'Downloading images'
	./scripts/download-images.sh

tex/cards.tex: decklist.txt scripts/generate_cards_tex.sh
	./scripts/generate_cards_tex.sh



####################
# Cleaning Targets #
####################

.PHONY: clean clean-tex clean-vscode

clean: clean-tex clean-vscode
	rm proxies.pdf tex/cards.tex || true

clean-tex:
	rm tex/proxies.{aux,bbl,blg,log,out,pdf} || true

clean-vscode:
	rm tex/proxies.{fdb_latexmk,fls,synctex.gz} || true

