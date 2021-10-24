open! Base 

let count = Raylib.get_monitor_count
let current = Raylib.get_current_monitor
let position = Raylib.get_monitor_position
let width =  Raylib.get_monitor_width
let height =  Raylib.get_monitor_height
let physical_width =  Raylib.get_monitor_physical_width
let physical_height =  Raylib.get_monitor_physical_height
let refresh_rate = Raylib.get_monitor_refresh_rate
let current_refresh_rate () = refresh_rate (current ())
let name = Raylib.get_monitor_name