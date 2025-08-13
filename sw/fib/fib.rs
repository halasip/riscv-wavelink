fn main() {
  println!("{}",fib(8));
}
fn fib(x: u32) -> u32 {
  if x == 0 { return 0; }
  x + fib(x-1)
}
