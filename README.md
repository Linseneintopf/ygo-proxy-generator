# Yu-Gi-Oh! Proxy Generator


The Proxy generator takes a deck list and turns it into a printable PDF with card images that can be cut out and used as proxies intead of actual cards.
It was developed for Linux, but there might be ways to get it to work on Windows or OSX.
The card images are downloaded from `yugioh.fandom.com`, since their images are easily accessible and usually of sufficient quality.
Support for YGOPro deck files may or may not be added in the future.


## How to use

##### TLDR

- place card names in `decklist.txt` (each card on a new line)
- execute `make`

##### Long version

To generate proxies, insert the names of the required cards in `decklist.txt` (simply replace the existing example decklist).
Make sure to spell all card names correctly and place each card name on a new line.
Lines starting with `#` will be ignored.
Then execute `make` on the command line while in the same folder as the decklist and this README.
This can take up to a few minutes, depending on the number of images that need to be downloaded.
Once the process has been completed, a file named `proxies.pdf` is created.
Open the file and check whether all card images look the way they should.
If not, check the troubleshooting section.
If everything looks fine, print out the file (make sure not to use duplex printing) and cut out the cards.
For an optimal experience, put the proxies in sleeves with actual Yu-Gi-Oh! cards behind them.


## Prerequisites

This project was developed and tested on Linux, but there might be ways to get this to work on Windows or OSX.
The follwing executables are required to use the project:

- `pdflatex` for generating the pdf file
- `make` to execute Makefile targets

These executables are also required, but should already be installed on most Linux systems:

- `curl` for downloading the images
- `sh`, since some of the logic is implemented in shell scripts
    - `sed`, `xargs`: utilities used in the scripts


## Troubleshooting

### Card image not found

If a card could not be found on `yugioh.fandom.com`, an error message will be printed and a gray placeholder card will be inserted into the PDF.
If this happens, please make sure that the card's name is spelled correctly, so the scripts can find the appropriate page on the Yu-Gi-Oh! fandom website.
If the script cannot find the page regardless or if no such page exists, download an image of the card manually and place it in the `images/` folder.
Make sure the image is cropped exactly to the edges of the card, otherwise the proxy will not have the correct size or not look like the actual card.
Name the image file like the name of the card, but replace whitespaces with underscores (`_`) and remove all hash symbols (`#`) if there are any.
Use the `.png` file extension, even if the image uses another format (like JPG).
Then retry generating the PDF file.

### Resolution not good enough/card text illegible

The card images on the Yu-Gi-Oh! fandom website are usually of high enough quality for the card text to be legible.
If this is not the case, find a higher-res image of that card online (or create one yourself) and and replace the original image in the `images/` folder.
It is named like the card itself, but with underscores (`_`) instead of whitespaces and no hash symbols (`#`).
Make sure the new image file also uses the `.png` file extension, even if the image uses another format (like JPG).
Re-generate the PDF file to apply the changes.
The new card image will be used for all further deck lists as well.

### The program crashes, hangs or does not produce a PDF file

If this happens, please open an issue and I will try to fix it as soon as i have time.
Please include all information required to recreate the problem, most importantly your `decklist.txt`.
