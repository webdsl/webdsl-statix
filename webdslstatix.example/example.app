application test
page root { } // always need a root page in a webdsl app
entity Ent1 {
  x : Int
  e2 : Ent2
}
entity Ent2 {
  y : String
  e1 : Ent1
}
function f(x : String) : String {
  var x : String := "hello";
  var y := Ent1{};
  return x + y.x;
}
