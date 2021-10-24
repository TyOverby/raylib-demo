open! Base

include Raylib.Camera2D

let sexp_of_t t =
  Sexp.List [
    Sexp.List [
      Sexp.Atom "offset";
      t |> offset |> Vector2.sexp_of_t;
    ];
    Sexp.List [
      Sexp.Atom "target";
      t |> target |> Vector2.sexp_of_t;
    ];
    Sexp.List [
      Sexp.Atom "rotation";
      t |> rotation |> sexp_of_float
    ];
    Sexp.List [
      Sexp.Atom "zoom";
      t |> zoom |> sexp_of_float
    ]
  ]
;;

let create ~offset ~target ~rotation ~zoom =
  create offset target rotation zoom 

let set_target_x camera = Raylib.Vector2.set_x (target camera) 

let set_target_y camera = Raylib.Vector2.set_y (target camera)

let with_ t ~f = 
  Raylib.begin_mode_2d t;
  f ();
  Raylib.end_mode_2d ()

let matrix = Raylib.get_camera_matrix_2d 

let world_to_screen t v = Raylib.get_world_to_screen_2d v t 
let screen_to_world t v = Raylib.get_screen_to_world_2d v t 