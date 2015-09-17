

#' Add escape slashes to a regex control character
#' @keywords internal
escape_regex <- function(xs) {
  str_replace_all(xs, "([>)(?&@^)])", "\\\\\\1")

}


#' Convert a Worldbet string to IPA
#' @param xs a character vector of WorldBet strings
#' @return a character vector of Unicode IPA symbols
#' @export
#' @examples
#' convert_bet_to_ipa("TIn")
#' #> [1] "θɪn"
#' convert_bet_to_ipa(c("TIn", "SUg&_r"))
#' #> [1] "θɪn"  "ʃʊgɚ"
convert_bet_to_ipa <- function(xs) {
  vapply(xs, from_bet_to_ipa, character(1), USE.NAMES = FALSE)
}

#' Convert a Worldbet string to HTML entities
#' @inheritParams convert_bet_to_ipa
#' @return a character vector of Unicode IPA symbols
#' @export
#' @examples
#' convert_bet_to_entity("TIn")
#' #> [1] "θɪn"
#' convert_bet_to_ipa(c("TIn", "SUg&_r"))
#' #> [1] "θɪn"  "ʃʊgɚ"
convert_bet_to_entity <- function(xs) {
  vapply(xs, from_bet_to_entity, character(1), USE.NAMES = FALSE)
}

# Create a function that converts one symbol from one representation to another
make_converter <- function(tokens, lookup) {
  function(x) {
    chunks <- str_tokenize(x, tokens) %>% str_drop_blanks
    str_collapse(lookup[chunks])
  }
}

from_bet_to_ipa <- make_converter(names(to_ipa), to_ipa)
from_bet_to_entity <- make_converter(names(to_entity), to_entity)




# Collapse a vector of strings into a single string
str_collapse <- function(xs) paste0(xs, collapse = "")

# Extract first character of a string
str_onset <- function(x) str_extract(x, "^.")

# Find longest string
str_longest <- function(xs) xs[which.max(nchar(xs))]

# Remove empty strings
str_drop_blanks <- function(xs) xs[xs != ""]

# Break a string into a vector of predefined tokens
str_tokenize <- function(x, tokens) chomp_tokens("", x, tokens)

# Recursively remove tokens from the onset of a string
chomp_tokens <- function(left, right, tokens) {
  # Find the largest matching chunk from the start of the word
  first <- str_onset(right) %>% escape_regex
  continuations <- str_subset(tokens, paste0("^", first))
  bite <- str_longest(continuations)

  # Bite off that chunk from the string
  leftover <- str_replace(right, escape_regex(bite), "") %>% str_drop_blanks
  left <- c(left, bite)
  right <- leftover

  # Repeat if there's more to consume
  if (length(leftover) != 0) chomp_tokens(left, leftover, tokens) else left
}

