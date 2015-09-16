

#' Add escape slashes to a regex control character
#' @keywords internal
escape_regex <- function(xs) {
  str_replace_all(xs, "([>)(?&@^)])", "\\\\\\1")

}


#' Convert a Worldbet string to IPA
#' @export
convert_bet_to_ipa <- function(bet) {
  str_replace_all(bet, segmentals_to_ipa)
}
