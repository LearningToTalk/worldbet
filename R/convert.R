

#' Add escape slashes to a regex control character
#' @keywords internal
escape_regex <- function(xs) {
  str_replace_all(xs, "([>)(?&@^)])", "\\\\\\1")

}


#' Convert a Worldbet string to IPA
#' @export
convert_bet_to_ipa <- function(bet) {
  # First convert diacritics, then segmentals
  bet %>%
    str_replace_all(bet_to_ipa$accented) %>%
    str_replace_all(bet_to_ipa$diacritics) %>%
    str_replace_all(bet_to_ipa$segments)
}

# convert_bet_to_html <- function(bet) {
#   str_replace_all(bet, segmentals_to_ipa)
# }
