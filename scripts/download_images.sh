#! /bin/bash


# normalise current working directory
cd "$(dirname ${0})"
# import function read_decklist
. ./read_decklist.sh


readonly fandom_base_url='https://yugioh.fandom.com/wiki/'
readonly image_path='../images'


# Parameters:
# 1. A card name with underscores (_) instead of whitespaces, no hash signs (#),
#    no dollar signs ($) and correct capitalisation
#    e.g. Mystical_Space_Typhoon
#    or a card passcode (eight-digit number in the bottom left corner of the card)
#    e.g. 05318639
function download_image() {
    card_name="${1}"

    # urlencode question marks (?) and ampersands (&) in the card's name
    # the URL also works if card_name is a passcode, because the wiki
    # automatically redirects to the correct page
    url="${fandom_base_url}$(echo "${card_name}" | sed -e 's/?/%3F/g' -e 's/&/%26/g')"
    # change double quotes (") in the card's name to single quotes (')
    outfile="${image_path}/${card_name//\"/\'}.png"

    # skip images that have already been downloaded
    [ -f "${outfile}" ] && return 0

    # check whether the card exists
    if ! curl "${url}" --location --head --fail >/dev/null 2>&1; then
        echo "Error: Could not find card \"${card}\"" >&2
        return 1
    fi

    # 1. look up the Yu-Gi-Oh! fandom page of the required card at ${url}
    # 2. from the returned HTML, extract the image from this line:
    #    <meta property="og:image" content="[image-url]" />
    # 3. download the image from that url and save it at ${outfile}
    curl "${url}" --location 2>/dev/null \
        | sed -n 's|^\s*<meta property="og:image" content="\(.*\)" \?/>$|\1|p' \
        | xargs curl 2>/dev/null > "${outfile}"

    # check whether the image exists
    if [ ! -s "${outfile}" ]; then
        rm -f "${outfile}"
        echo "Error: Could not download card \"${card}\"" >&2
        return 1
    fi
}



read_decklist | while read card; do

    download_image ${card}
    printf "."

done

echo "done"
