//is not of type Int

application test

  page root { }

  entity User{}
  function a(){
    var a :Int := "string";
    var a :Int := User{};
    
  }
