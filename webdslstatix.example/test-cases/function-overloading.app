application function_overloading

page root {}

entity Ent1 {
  x : String
  y : String
}

entity Ent2 : Ent1 {
  z : String
}

entity Ent3 : Ent2 {}

function x() : String {
  return "";
}

function x(i : Int) : Ent1 {
  return Ent1{};
}

function x(e : Ent1) {}
function x(e : Ent2) {}
//function x(e : Ent3) {}
//function x(e : Ent2) {}

function y(e1 : Ent1, e2 : Ent1) {}
function y(e1 : Ent1, e2 : Ent2) {}
function y(e1 : Ent2, e2 : Ent1) {}

function test() {
  x();
  x(1);
  x(null);
  x(Ent1{});
  x(Ent2{});
  x(Ent3{});
  
  y(Ent1{}, Ent1{});
  y(Ent1{}, Ent2{});
  y(Ent2{}, Ent2{});
}
