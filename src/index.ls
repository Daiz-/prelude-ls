require! [
  './Func.js'
  './List.js'
  './Obj.js'
  './Str.js'
  './Num.js'
]

id = (x) -> x

is-type = (type, x) --> typeof! x is type

replicate = (n, x) -->
  [x for til n]


Str <<< List{
  empty, slice, take, drop, split-at, take-while, drop-while, span, break-str: break-list
}

prelude = {
  Func, List, Obj, Str, Num,
  id, is-type
  replicate,
}
prelude <<< List{
  each, map, filter, compact, reject, partition, find,
  head, first, tail, last, initial, empty,
  reverse, difference, intersection, union, count-by, group-by,
  fold, foldl, fold1, foldl1, foldr, foldr1, unfoldr, and-list, or-list,
  any, all, unique, sort, sort-with, sort-by, sum, product, mean, average,
  concat, concat-map, flatten,
  maximum, minimum, scan, scanl, scan1, scanl1, scanr, scanr1,
  slice, take, drop, split-at, take-while, drop-while, span, break-list,
  zip, zip-with, zip-all, zip-all-with,
}
prelude <<< Func{
  apply, curry, flip, fix,
}
prelude <<< Str{
  split, join, lines, unlines, words, unwords, chars, unchars
}
# not importing all of Obj's functions
prelude <<< Obj{
  values, keys,
  pairs-to-obj, obj-to-pairs, lists-to-obj, obj-to-lists,
}
prelude <<< Num{
  max, min, negate, abs, signum, quot, rem, div, mod, recip,
  pi, tau, exp, sqrt, ln, pow, sin, tan, cos, acos, asin, atan, atan2,
  truncate, round, ceiling, floor, is-it-NaN, even, odd, gcd, lcm,
}

prelude <<< do

  empty: (input) ->
    switch typeof! input
    | \Array  => List.empty ...
    | \Object =>  Obj.empty ...

  each: (f, input) -->
    switch typeof! input
    | \Array  => List.each ...
    | \Object =>  Obj.each ...

  map: (f, input) -->
    switch typeof! input
    | \Array  => List.map ...
    | \Object =>  Obj.map ...

  compact: (input) -->
    switch typeof! input
    | \Array  => List.compact ...
    | \Object =>  Obj.compact ...

  filter: (f, input) -->
    switch typeof! input
    | \Array  => List.filter ...
    | \Object =>  Obj.filter ...

  reject: (f, input) -->
    switch typeof! input
    | \Array  => List.reject ...
    | \Object =>  Obj.reject ...

  partition: (f, input) -->
    switch typeof! input
    | \Array  => List.partition ...
    | \Object =>  Obj.partition ...

  find: (f, input) -->
    switch typeof! input
    | \Array  => List.find ...
    | \Object =>  Obj.find ...





prelude.VERSION = '1.0.1'

module.exports = prelude
