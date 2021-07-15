//No function

application test

  page root { }

section datamodel


  function getA(i : Int) : String {
    return "a";
  }
  
  function useA() {
    getA("Fiets");
  }

