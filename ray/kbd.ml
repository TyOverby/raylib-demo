open! Base

module Key = struct 
  module T = struct
    type t = Raylib.Key.t = 
      | Null 
      | Apostrophe 
      | Comma 
      | Minus 
      | Period 
      | Slash 
      | Zero 
      | One 
      | Two 
      | Three 
      | Four 
      | Five 
      | Six 
      | Seven 
      | Eight 
      | Nine 
      | Semicolon 
      | Equal 
      | A 
      | B 
      | C 
      | D 
      | E 
      | F 
      | G 
      | H 
      | I 
      | J 
      | K 
      | L 
      | M 
      | N 
      | O 
      | P 
      | Q 
      | R 
      | S 
      | T 
      | U 
      | V 
      | W 
      | X 
      | Y 
      | Z 
      | Space 
      | Escape 
      | Enter 
      | Tab 
      | Backspace 
      | Insert 
      | Delete 
      | Right 
      | Left 
      | Down 
      | Up 
      | Page_up 
      | Page_down 
      | Home 
      | End 
      | Caps_lock 
      | Scroll_lock 
      | Num_lock 
      | Print_screen 
      | Pause 
      | F1 
      | F2 
      | F3 
      | F4 
      | F5 
      | F6 
      | F7 
      | F8 
      | F9 
      | F10 
      | F11 
      | F12 
      | Left_shift 
      | Left_control 
      | Left_alt 
      | Left_super 
      | Right_shift 
      | Right_control 
      | Right_alt 
      | Right_super 
      | Kb_menu 
      | Left_bracket 
      | Backslash 
      | Right_bracket 
      | Grave 
      | Kp_0 
      | Kp_1 
      | Kp_2 
      | Kp_3 
      | Kp_4 
      | Kp_5 
      | Kp_6 
      | Kp_7 
      | Kp_8 
      | Kp_9 
      | Kp_decimal 
      | Kp_divide 
      | Kp_multiply 
      | Kp_subtract 
      | Kp_add 
      | Kp_enter 
      | Kp_equal 
      | Back 
      | Menu 
      | Volume_up 
      | Volume_down 
      [@@deriving sexp, equal, compare]
  end

  include Comparator.Make(T)
  include T
end

let is_pressed = Raylib.is_key_pressed

let is_down = Raylib.is_key_down
let is_up = Raylib.is_key_up
let is_released = Raylib.is_key_released

let set_exit_key = Raylib.set_exit_key

module State = struct 
  type t = Set.M(Key).t

  let get () = 
    let rec loop acc =
      match Raylib.get_key_pressed () with 
      | Null -> acc
      | other -> loop (Set.add acc other)
    in
    loop (Set.empty (module Key))

  let diff = Set.symmetric_diff
end