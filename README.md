<!-- README.md is generated from README.Rmd. Please edit that file -->
worldbet: Convert WorldBet to IPA
=================================

This package is quick-and-dirty way to convert worldbet ASCII characters into different representations.

Inside of R: RStudio
--------------------

RStudio has rich support for UTF-8 symbols. Here is how some WorldBet-toiPA conversions look in RStudio.

``` r
library("worldbet")

# that
convert_bet_to_ipa("D@t")
#> [1] "ðæt"

# uh-oh
convert_bet_to_ipa("^?o")
#> [1] "ʌʔo"

# water, weather (vector input)
convert_bet_to_ipa(c("wA)&_r", "wED&_r"))
#> [1] "wɑɾɚ" "wɛðɚ"
```

Inside of R: Command Line
-------------------------

From the command prompt on Windows, R falls back to escape sequences during the conversions.

``` r
# that
convert_bet_to_ipa("D@t")
#> [1] "ðæt"

# uh-oh
convert_bet_to_ipa("^?o")
#> [1] "<U+028C><U+0294>o"

# water, weather (vector input)
convert_bet_to_ipa(c("wA)&_r", "wED&_r"))
#> [1] "w<U+0251><U+027E><U+025A>" "w<U+025B>ð<U+025A>"
```

Outside of R: HTML Entities
---------------------------

For RMarkdown documents, we can use HTML entities for in-text use of IPA. For example, we could write the following RMarkdown in our prose:

    The word was /`r convert_bet_to_entity('SIp')`/ ("ship").

RMarkdown-to-markdown conversion then yields the following text with HTML entities instead of WorldBet symbols:

    The word was /&#x283;&#x26A;&#x70;/ ("ship").

Finally, markdown-to-HTML conversion yields the following human-readable form of the symbols.

> The word was /ʃɪp/ ("ship").

WorldBet specification
----------------------

The table below shows the implementation of the WorldBet used in the package.

    #> 
    #> Attaching package: 'dplyr'
    #> 
    #> The following objects are masked from 'package:stats':
    #> 
    #>     filter, lag
    #> 
    #> The following objects are masked from 'package:base':
    #> 
    #>     intersect, setdiff, setequal, union

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
| `&_r`    | ɚ   | `&#x25A;`   |
