// ABC001-C
//

use std::io;

const POWS: [i32; 12] = [2, 15, 33, 54, 79, 107, 138, 171, 207, 244, 284, 326];
const DIRS: [&str; 16] = [
  "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE",
  "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"
  ];

fn main() {
  let (deg, dis) = input();
  let (d, p) = logic(deg, dis);
  output(d, p)
}

fn input() -> (i32, i32) {
  let mut line = String::new();
  io::stdin().read_line(&mut line).ok();
  //println!("line={}", line);
  let mut a: Vec<i32> = vec![];
  for v in line.trim().split(" ") {
    //println!("v={}", v);
    a.push(v.parse().unwrap());
  }
  (a[0], a[1])
}

fn output(d: String, p: i32) {
  println!("{} {}", d, p)
}

fn logic(deg: i32, dis: i32) -> (String, i32) {
  let ws = (dis + 3) / 6;
  let p = calc_power(ws);
  let d = select_dir(deg, p);
  (d, p)
}

fn calc_power(ws: i32) -> i32 {
  let mut wp: i32 = 0;
  for p in POWS.iter() {
    if ws <= *p {
      break;
    }
    wp += 1
  }
  wp
}

fn select_dir(deg: i32, p: i32) -> String {
  if p == 0 {
    "C".to_string()
  } else {
    let i: usize = (((deg + 112) % 3600) / 225) as usize;
    DIRS[i].to_string()
  }
}


// ---
