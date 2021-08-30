// function getA has no return type but tries to return a variable

application test

  page root { }

section datamodel

  function getA(i : Int) : String {
    return "a";
  }
  
  extend function getA(i : Int) {
    return "b";
  }
