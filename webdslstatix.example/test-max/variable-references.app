application variable_references

  var a : Ent1 := b
  var b : Ent1 := a
  var c : Ent1 := c

  var d : Ent1 := Ent1{}
  var d : Ent1 := Ent1{}

  var other : Ent1 := Ent1{}

  entity Ent1 {
    name   : String
    name2  : String // error: Property 'name2' of entity 'Ent1' is defined multiple times
    name2  : String // error: Property 'name2' of entity 'Ent1' is defined multiple times
    name3  : String
    others : List<Ent1>
  }

  entity Ent2 : Ent1 {
    name3 : String // error: Property 'name3' of entity 'Ent2' is defined multiple times
    other : Ent1

    function ent2func1(other : Ent1) : Ent1 {
      var other : Ent1; // error: Variable 'other' is already defined in this context
      var x : String := "asd";

      var int2 : Int := int1; // error: Variable 'int1' is not defined 
      var int1 : Int := int2;

      int1 := int1 + int1;

      var myEnt : Ent1 := myEnt; // error: variable myEnt is not defined

      if (x == "asd") {
        var x : String := "dsa";  // error: Variable 'x' is already defined in this context
        var y : String := "asdasd";
        y := y + y;
      }

      var z : String := x + y;  // error: Variable 'z' is already defined in this context

      return other;
    }
  }

  function globalFunc1(x : String) : String {
    var y : String := "asdasd";
    return x + y;
  }

  extend function globalFunc1(x : String) : String {
    var y : String := x;
    return y;
  }

  page root() {}
