

all: proxies.pdf

proxies.pdf:
	# TODO

.PHONY: download-images

download-images: images
	# TODO

images:
	mkdir images


.PHONY: clean clean-tex clean-vscode

clean: clean-tex clean-vscode
	rm proxies.pdf || true

clean-tex:
	rm tex/proxies.{aux,bbl,blg,log,out} || true

clean-vscode:
	rm tex/proxies.{fdb_latexmk,fls,synctex.gz} || true

