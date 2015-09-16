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

WorldBet specification
----------------------

The table below shows the implementation of the WorldBet used in the package.

| WorldBet | IPA | HTML Entity |
|:---------|:----|:------------|
| `p`      | p   | `&#x70;`    |
| `b`      | b   | `&#x62;`    |
| `m`      | m   | `&#x6D;`    |
| `t`      | t   | `&#x74;`    |
| `d`      | d   | `&#x64;`    |
| `n`      | n   | `&#x6E;`    |
| `k`      | k   | `&#x6B;`    |
| `g`      | ɡ   | `&#x261;`   |
| `N`      | ŋ   | `&#x14B;`   |
| `?`      | ʔ   | `&#x294;`   |
| `f`      | f   | `&#x66;`    |
| `v`      | v   | `&#x76;`    |
| `T`      | θ   | `&#x3B8;`   |
| `D`      | ð   | `&#xF0;`    |
| `s`      | s   | `&#x73;`    |
| `z`      | z   | `&#x7A;`    |
| `S`      | ʃ   | `&#x283;`   |
| `Z`      | ʒ   | `&#x292;`   |
| `h`      | h   | `&#x68;`    |
| `h_v`    | ɦ   | `&#x266;`   |
| `)`      | ɾ   | `&#x27E;`   |
| `l`      | l   | `&#x6C;`    |
| `9`      | ɹ   | `&#x279;`   |
| `j`      | j   | `&#x6A;`    |
| `w`      | w   | `&#x77;`    |
| `W`      | ʍ   | `&#x28D;`   |
| `i`      | i   | `&#x69;`    |
| `I`      | ɪ   | `&#x26A;`   |
| `e`      | e   | `&#x65;`    |
| `E`      | ɛ   | `&#x25B;`   |
| `@`      | æ   | `&#xE6;`    |
| `a`      | a   | `&#x61;`    |
| `&`      | ə   | `&#x259;`   |
| `3`      | ɜ   | `&#x25C;`   |
| `u`      | u   | `&#x75;`    |
| `U`      | ʊ   | `&#x28A;`   |
| `o`      | o   | `&#x6F;`    |
| `^`      | ʌ   | `&#x28C;`   |
| `>`      | ɔ   | `&#x254;`   |
| `A`      | ɑ   | `&#x251;`   |
| `_r`     | ˞   | `&#x2DE;`   |
