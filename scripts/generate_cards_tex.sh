#! /bin/sh


# this script generates LaTeX code that inserts the card images into the document

readonly out_path='../tex/cards.tex'
readonly deck_list_path='../decklist.txt'


function generate_tex() {
    line_count=''

    while read card; do

        # TODO: deduplicate code

        # replace spaces with underscores in the card's name
        # missing quotation marks remove leading and trailing whitespace
        card=${card// /_}

        # skip empty lines
        [ -z "${card}" ] && continue
        # skip images that have already been downloaded
        [ -f "${image_path}/${card}.png" ] && continue

        # LaTeX code that inserts a card (% removes horizontal space between cards)
        echo "\card{${card}}%"

        # print a LaTeX line break after every third card
        line_count="${line_count}I"
        if [ ${line_count} = 'III' ]; then
            line_count=''
            echo '\\[-0.34mm]'
        fi

    done
}


cd "$(dirname ${0})"

generate_tex > "${out_path}" < "${deck_list_path}"
