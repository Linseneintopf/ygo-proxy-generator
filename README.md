# Yu-Gi-Oh! Proxy Generator

## How to use

**TODO: Write properly**

- insert names of the required cards in `decklist.txt`
    - make sure to spell all card names correctly
- execute `make` on the command line
- proxies.pdf einseitig drucken

## Troubleshooting

**TODO: Write properly**

### Card image not found

1. make sure the card name is spelled correctly
2. download manually, place in `images/`

### Resolution not good enough/card text illegible

-> download hi-res image manually, place in `images/`


## Prerequisites

This project was developed and tested on Linux, but there might be ways to get this to work on Windows.
The follwing executables are required to use the project:

- `pdflatex` for generating the pdf file
- `make` to execute Makefile targets

These executables are also required, but should already be installed on most Linux systems:

- `sh`, since some of the logic is implemented in a shell script
    - `sed`, `xargs`: utilities used in the script
- `curl` for downloading the images
