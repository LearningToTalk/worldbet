# Generate a data object from the translation table

worldbet_key <- read.table(
  "data-raw/worldbet.txt",
  sep = "\t",
  header = TRUE,
  encoding = "UTF-8",
  stringsAsFactors = FALSE,
  # Otherwise html entities get messed up
  comment.char = ""
)

devtools::use_data(worldbet_key, internal = TRUE)
