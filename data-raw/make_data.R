# Generate data objects from the translation table
library("stringr")
library("dplyr", warn.conflicts = FALSE)

worldbet_key <- read.table(
  "data-raw/worldbet.txt",
  sep = "\t",
  header = TRUE,
  encoding = "UTF-8",
  stringsAsFactors = FALSE,
  # Otherwise html entities get messed up
  comment.char = ""
)

# Package up dataframe used for symbol conversions
devtools::use_data(worldbet_key, overwrite = TRUE)

# Package-internal lookup tables
to_ipa <- setNames(worldbet_key$IPA, worldbet_key$WorldBet)
to_entity <- setNames(worldbet_key$Entity, worldbet_key$WorldBet)

devtools::use_data(to_ipa, to_entity, internal = TRUE, overwrite = TRUE)
