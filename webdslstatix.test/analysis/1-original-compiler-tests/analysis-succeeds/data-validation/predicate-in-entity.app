application registerexample

  entity User {
    name :: String
    s -> StringContainer
    predicate test(){s.s.length() > 3}
  }
  
  entity StringContainer{
    s :: String
  }

  principal is User with credentials name

  var testUser := User{ s := StringContainer{s:="12345"}  }
  
  define page root() {}
  
  test predicateinentity{
    assert(testUser.test());
  }
