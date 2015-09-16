<!-- README.md is generated from README.Rmd. Please edit that file -->
worldbet: Convert WorldBet to IPA
=================================

This package is quick-and-dirty way to convert worldbet ASCII characters into different representations.

Here is how the conversions look in RStudio.

``` r
library("worldbet")

# that
convert_bet_to_ipa("D@t")
#> [1] "ðæt"

# uh-oh
convert_bet_to_ipa("^?o")
#> [1] "ʌʔo"

# diacritics are not supported yet
convert_bet_to_ipa("wA)&_r")
#> [1] "wɑɾə_r"
```

From the command prompt (on Windows), R falls back to escape sequences during the conversions.

``` r
library("worldbet")

# that
convert_bet_to_ipa("D@t")
#> [1] "ðæt"

# uh-oh
convert_bet_to_ipa("^?o")
#> [1] "<U+028C><U+0294>o"

# diacritics are not supported yet
convert_bet_to_ipa("wA)&_r")
#> [1] "w<U+0251><U+027E><U+0259>_r"
```
