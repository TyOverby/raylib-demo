open! Base 
let should_close = Raylib.window_should_close
let close = Raylib.close_window
let is_ready = Raylib.is_window_ready
let is_fullscreen = Raylib.is_window_fullscreen
let is_hidden = Raylib.is_window_hidden
let is_minimized = Raylib.is_window_minimized 
let is_maximized = Raylib.is_window_maximized
let is_focused = Raylib.is_window_focused
let is_resized = Raylib.is_window_resized
let toggle_fullscreen = Raylib.toggle_fullscreen
let minimize = Raylib.minimize_window
let restore = Raylib.restore_window
let set_icon = Raylib.set_window_icon
let set_title = Raylib.set_window_title
let set_position = Raylib.set_window_position
let set_monitor = Raylib.set_window_monitor
let set_min_size = Raylib.set_window_min_size
let set_size = Raylib.set_window_size
let position = Raylib.get_window_position
let scale_dpi = Raylib.get_window_scale_dpi
let set_target_fps = Raylib.set_target_fps
let init ?(is_resizable=true) ?(title="") ~width ~height  () = 
  if is_resizable then Raylib.set_config_flags [Raylib.ConfigFlags.Window_resizable];
  Raylib.init_window width height title;
  set_target_fps (Monitor.current_refresh_rate ())
;;

let close_if_requested () = if should_close () then close ()