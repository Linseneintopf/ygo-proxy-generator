# no shebang
# this script is supposed to be sourced from other scripts, not run



readonly deck_list_path='../decklist.txt'


# reads the decklist at ${deck_list_path} and pre-processes it
# outputs a list of card names or card passcodes, separated by newlines
function read_decklist() {

    while read card; do

        # replace spaces with underscores in the card's name
        # missing quotation marks remove leading and trailing whitespace
        card=${card// /_}

        # skip empty lines
        [ -z "${card}" ] && continue
        # skip comments (lines that start with '#')
        [ "${card:0:1}" = '#' ] && continue
        # skip lines that are '!side'
        # these appear in .ydk files and indicate the start of the side deck
        [ "${card}" = '!side' ] && continue
        # the main and extra deck indicators in .ydk files are '#main' and
        # '#extra', so they don't need to be handled separately

        # remove all '#' from the card name because
        # 1. LaTeX can't deal with it properly
        # 2. the character is removed from Yu-Gi-Oh! fandom URLs
        card="${card//#/}"

        # remove all '$' from the card name because
        # 1. LaTeX interprets it weirdly and throws a warning
        # 2. the character does not seem to exist in Yu-Gi-Oh! card names
        card="${card//$/}"

        echo "${card}"

    done < "${deck_list_path}"
}
