# Notes


## Reading the decklist

- the decklist is read through a function called `read_decklist`
- it can be imported by sourcing the script `read_decklist.sh`


## Downloading card images

- Retrieve this URL: `https://yugioh.fandom.com/wiki/[Card-Name]`
    - `[Card-Name]` is the name of the card or its [passcode](https://yugioh.fandom.com/wiki/Passcode)
        - The passcode is the eight-digit number printed in the bottom left corner of each card
    - Use underscores (`_`) instead of spaces
    - Remove hash symbols (`#`) and dollar signs (`$`)
    - Pay attention to correct capitalisation
- find this line in the HTML file:
```HTML
    <meta property="og:image" content="[image-url]" />
```
- extract [image-url]
- download the image from this url
