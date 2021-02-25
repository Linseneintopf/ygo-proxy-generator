# no shebang
# this script is supposed to be sourced from other scripts, not run



readonly deck_list_path='../decklist.txt'


# reads the decklist at ${deck_list_path} and pre-processes it
# outputs a list of card names, separated by newlines
function read_decklist() {

    while read card; do

        # replace spaces with underscores in the card's name
        # missing quotation marks remove leading and trailing whitespace
        card=${card// /_}

        # skip empty lines
        [ -z "${card}" ] && continue
        # skip comments (lines that start with '#')
        [ "${card:0:1}" = '#' ] && continue

        # remove all '#' from the card name because
        # 1. LaTeX can't deal with it properly
        # 2. the character is removed from Yu-Gi-Oh! fandom URLs
        card="${card//#/}"

        # remove all '$' from the card name because
        # 1. LaTeX interprets it weirdly and throws a warning
        # 2. the character does not seem to exist in Yu-Gi-Oh! card names
        card="${card//$/}"
        
        # ensure the first letter is capitalized
        echo "${card^}"

    done < "${deck_list_path}"
}
