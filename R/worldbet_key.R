# #' WorldBet symbol key
# #'
# #' A table containing different representations of IPA symbols.
# #'
# #' @format A data frame with 41 rows and 3 variables:
# #' \describe{
# #'   \item{WorldBet}{ASCII representation of the symbol}
# #'   \item{IPA}{IPA symbol, encoded in UTF-8}
# #'   \item{Entity}{HTML entity of the symbol}
# #' }
# "worldbet_key"
#

# diacritics <- worldbet_key[str_detect(worldbet_key$WorldBet, "_"), ]
# segmentals <- worldbet_key[!str_detect(worldbet_key$WorldBet, "_"), ]
# segmentals_to_ipa <- structure(segmentals$IPA, names = escape_regex(segmentals$WorldBet))
