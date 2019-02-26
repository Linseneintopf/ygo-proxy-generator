#! /bin/sh


readonly fandom_base_url='https://yugioh.fandom.com/wiki/'
readonly image_path='../images'
readonly deck_list_path='../decklist.txt'


# Parameters:
# 1. A card name with underscores instead of whitespaces and correct capitalisation
#    e.g. Mystical_Space_Typhoon
function download_image() {
    card_name="${1}"
    url="${fandom_base_url}${card_name}"
    outfile="${image_path}/${card_name}.png"

    # 1. look up the Yu-Gi-Oh! fandom page of the required card at ${url}
    # 2. from the returned HTML, extract the image from this line:
    #    <meta property="og:image" content="[image-url]" />
    # 3. download the image from that url and save it at ${outfile}
    curl "${url}" 2>/dev/null \
        | sed -n 's/^\s*<meta property="og:image" content="\(.*\)" \/>$/\1/p' \
        | xargs curl 2>/dev/null > "${outfile}"
}



cd "$(dirname ${0})"


while read card; do

    # replace spaces with underscores in the card's name
    # missing quotation marks remove leading and trailing whitespace
    card=${card// /_}

    # skip empty lines
    [ -z "${card}" ] && continue
    # skip images that have already been downloaded
    [ -f "${image_path}/${card}.png" ] && continue

    download_image ${card}
    printf "."

done < "${deck_list_path}"


echo "done"
