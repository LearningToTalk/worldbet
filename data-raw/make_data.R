# Generate data objects from the translation table
library("stringr")

worldbet_key <- read.table(
  "data-raw/worldbet.txt",
  sep = "\t",
  header = TRUE,
  encoding = "UTF-8",
  stringsAsFactors = FALSE,
  # Otherwise html entities get messed up
  comment.char = ""
)

# Main dataframe for symbol conversions
devtools::use_data(worldbet_key, overwrite = TRUE)

# Load the escape_regex function
devtools::load_all()

negate = TRUE

# Create a named vector of string-rewrite rules for converting worldbet to ipa
prep_ipa <- function(pattern, negate) {
  f <- if (negate) Negate(str_detect) else str_detect
  hits <- worldbet_key[f(worldbet_key$WorldBet, pattern), ]
  setNames(hits$IPA, escape_regex(hits$WorldBet))
}

# Package-internal chunks of data
bet_to_ipa <- list(
  # WorldBet items with inherent diacritics: X_X
  accented = prep_ipa("._.", negate = FALSE),
  # WorldBet diacritics: _X
  diacritics = prep_ipa("^_", negate = FALSE),
  # Plain old segments (anything without an underscore)
  segments = prep_ipa(pattern = "_", negate = TRUE)
)


devtools::use_data(bet_to_ipa, internal = TRUE, overwrite = TRUE)
