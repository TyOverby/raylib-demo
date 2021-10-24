open! Base

let with_ ~f = 
  Raylib.begin_drawing();
  f ();
  Raylib.end_drawing ()
;;

let clear ?(color=Color.white) () = Raylib.clear_background color

let pixel ~x ~y color = Raylib.draw_pixel x y color
let pixel_v v color = Raylib.draw_pixel_v v color

let line ?(thickness=1.0) ~x1 ~y1 ~x2 ~y2 color = 
  if Float.equal thickness 1.0 then 
    Raylib.draw_line x1 y1 x2 y2 color
  else 
    Raylib.draw_line_ex 
      (Vector2.create ~x:(Float.of_int x1) ~y:(Float.of_int y1))
      (Vector2.create ~x:(Float.of_int x2) ~y:(Float.of_int y2))
      thickness 
      color

let line_v ?(thickness=1.0) p1 p2 color = 
  Raylib.draw_line_ex p1 p2 thickness color

let text ?(color=Color.black) ~x ~y ~size text = 
  Raylib.draw_text text x y size color


let rect ~x ~y ~width ~height color = Raylib.draw_rectangle x y width height color
