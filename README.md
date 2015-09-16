<!-- README.md is generated from README.Rmd. Please edit that file -->
worldbet: Convert WorldBet to IPA
=================================

``` r
library("worldbet")

# that
convert_bet_to_ipa("D@t")

# uh-oh
convert_bet_to_ipa("^?o")

# still working on diacritics though
convert_bet_to_ipa("wA)&_r")
```
