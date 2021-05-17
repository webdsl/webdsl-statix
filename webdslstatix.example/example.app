application example

imports built-in

  page root {
    "Hello World!"
  }

  entity Ent {
    x : Int
    y : String
    other : Ent
  }

  function f() : Int {
    var e := Ent{};

    return e.x;
  }
