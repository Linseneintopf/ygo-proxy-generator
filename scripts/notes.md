# Notes


## Reading the decklist

- the decklist is read through a function called `read_decklist`
- it can be imported by sourcing the script `read_decklist.sh`


## Downloading card images

- Retrieve this URL: `https://yugioh.fandom.com/wiki/[Card-Name]`
    - `[Card-Name]` is the name of the card
    - Use underscores (`_`) instead of spaces
    - pay attention to correct capitalisation
- find this line in the HTML file:
```HTML
    <meta property="og:image" content="[image-url]" />
```
- extract [image-url]
- download the image from this url
