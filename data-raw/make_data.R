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

# Package-internal chunks of data
diacritics <- worldbet_key[str_detect(worldbet_key$WorldBet, "_"), ]
segmentals <- worldbet_key[!str_detect(worldbet_key$WorldBet, "_"), ]
segmentals_to_ipa <- structure(segmentals$IPA, names = escape_regex(segmentals$WorldBet))
devtools::use_data(diacritics, segmentals, segmentals_to_ipa, internal = TRUE, overwrite = TRUE)
