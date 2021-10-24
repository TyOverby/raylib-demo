open! Base 
open Ray
let color = Color.create ~r:239 ~g:122 ~b:8
let width, height = 800, 450

let setup () =
  Window.init ~width:800 ~height:450 ~title:"shapes!" ();
  Camera2.create 
    ~offset:(Vector2.create ~x:0.0 ~y:0.0) 
    ~target:(Vector2.create ~x:0.0 ~y:0.0) 
    ~rotation:0.0 
    ~zoom:1.0 

  let modified ~low ~high = 
    match List.exists low ~f:Kbd.is_down, List.exists high ~f:Kbd.is_down with 
    | true, false -> 1.0 
    | false, true -> -1.0
    | _ -> 0.0

let rec loop (x, y) camera =
  Window.close_if_requested ();

  let x = x +. 
      modified 
      ~low:Kbd.Key.[H; Left; A] 
      ~high:Kbd.Key.[L;Right; D] in

  let y = y +. 
      modified 
      ~low:Kbd.Key.[K; Up; W] 
      ~high:Kbd.Key.[J; Down; S] in

  Camera2.set_target_x camera x;
  Camera2.set_target_y camera y;

  Draw.with_ ~f:(fun () -> 
    Draw.clear ~color:Color.raywhite ();
    Camera2.with_ camera ~f:(fun () -> 
      Draw.rect 
        ~x:(width / 2 - 128)
        ~y:(height / 2 - 128)
        ~width:256 
        ~height:256 
        Color.black;

      Draw.rect
        ~x:(width / 2 - 112)
        ~y:(height / 2 - 112)
        ~width:224 
        ~height:224 
        Color.raywhite;

      Draw.text ~x:(width / 2 - 44) ~y:(height / 2) ~size:50 "raylib";
      Draw.text ~x:(width / 2 - 99) ~y:(height / 2 + 18) ~size:50 ~color "OCaml" ;
      Draw.text ~x:350 ~y:370 ~size:10 ~color:Color.gray "this is NOT a texture!"));
  loop (x, y) camera

let () = loop (0.0, 0.0) (setup ())
