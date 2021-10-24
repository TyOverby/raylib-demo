open! Base 

include Raylib.Vector2

let create ~x ~y = create x y 
let sexp_of_t t =
  Sexp.List [
    t |> x |> sexp_of_float;
    t |> y |> sexp_of_float
  ]

