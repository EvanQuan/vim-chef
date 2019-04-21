" ============================================================================
" File: chef.vim
" Maintainer: https://github.com/EvanQuan/vim-chef/
" Version: 0.1.1
"
" Syntax highlighting for chef files.
" ============================================================================

if exists("b:current_syntax")
  finish
endif

syntax match chefNumber /[-]\?[0-9]\+/ contained
syntax keyword chefMeasure contained g kg pinch pinches ml l dash dashes cup cups
                                  \ teaspoon teaspoons tablespoon tablespoons
syntax match chefIngredientName /[a-zA-Z ]\+/ contained contains=chefMeasure,
      \ chefPreposition,chefMixingBowl,chefBakingDish,chefTimeUnit
syntax match chefIngredientDefinition /^[-]\?[0-9]\+ \(g\|kg\|pinch\|pinches\|ml\|l\|dash\|dashes\|cup\|cups\|teaspoon\|teaspoons\|tablespoon\|tablespoons\) [a-zA-Z ]\+$/ contains=chefNumber,chefMeasure,chefIngredientName,chefVerb
syntax keyword chefTimeUnit contained minute minutes hour hours
syntax keyword chefTemperatureUnit contained degree degrees Celsius
syntax keyword chefVerb contained Take Put Fold Add Remove Combine Divide Add Liquefy
                      \ Liquify Stir Mix Clean Pour Set Serve Refrigerate Wait
syntax match chefCustomVerb /[a-zA-Z]\+/ contained
syntax keyword chefPreposition from into to for until with contained
syntax match chefMethod /^\(Take\|Put\|Fold\|Add\|Remove\|Combine\|Divide\|Add\|Liquefy\|Liquify\|Mix\|Clean\|Pour\|Stir\|Set\|Serve\|Refrigerate\|Wait\) [0-9a-zA-Z ]\+.$/ contains=chefIngredientName,chefPreposition,chefVerb,chefMixingBowl,chefBakingDish,chefNumber,chefTimeUnit
syntax match chefMixingBowl /\(the\)\? mixing bowl/ contained
syntax match chefBakingDish /\(the\)\? baking dish/ contained
syntax match chefDryIngredients /dry ingredients/ contained
syntax match chefStartLoop /^[a-zA-Z]\+ the [a-zA-Z ]\+.$/ contains=chefCustomVerb,chefIngredientName
syntax match chefEndLoop /^[a-zA-Z]\+ until [a-zA-Z]\+ed.$/ contains=chefVerb,chefCustomVerb,chefEndLoopPreposition
syntax keyword chefEndLoopPreposition until contained
syntax keyword chefStartLoopPreposition the contained
syntax match chefIngredientsTitle /^Ingredients.$/
syntax match chefMethodsTitle /^Method.$/
syntax match chefCookingTimeLabel /^Cooking time: / contained
syntax match chefCookingTimeDefinition /^Cooking time: [-]\?[0-9]\+ \(minute\|minutes\|hour\|hours\).$/ contains=chefCookingTimeLabel,chefNumber,chefTimeUnit
syntax match chefPreheatOvenLabel /^Pre-heat oven /
syntax match chefPreheatOvenDefinition /^Pre-heat oven to [-]\?[0-9]\+ \(degree\|degrees\) Celsius.$/ contains=chefPreheatOvenLabel,chefPreposition,chefNumber,chefTemperatureUnit

highlight link chefNumber Number
highlight link chefMeasure Type
highlight link chefIngredientName Identifier
highlight link chefTimeUnit Type
highlight link chefTemperatureUnit Type
highlight link chefVerb Function
highlight link chefPreposition Operator
highlight link chefMixingBowl Constant
highlight link chefBakingDish Constant
highlight link chefDryIngredients Constant
highlight link chefCustomVerb Function
highlight link chefEndLoopPreposition Operator
highlight link chefStartLoopPreposition Operator
highlight link chefIngredientsTitle String
highlight link chefMethodsTitle String
highlight link chefCookingTimeLabel String
highlight link chefPreheatOvenLabel String

let b:current_syntax = "chef"
