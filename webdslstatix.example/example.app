application test

imports built-in

section test

page root { } // always need a root page in a webdsl app

entity Ent1 {
  e1 : Ent2
}

entity Ent2 {
  x : String
}

function f(x : String) : String {
  var y := Ent2{};
  return x + y.x;
}
