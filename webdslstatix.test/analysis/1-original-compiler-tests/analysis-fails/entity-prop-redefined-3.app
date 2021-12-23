//Property "test" of entity "User" is defined multiple times.

application test

  page root { }

  entity SuperUser {}

  entity User : SuperUser{
    test :: String (id) := "fsdjdskjf"  //nonsense derived property with annos
  }
  
  extend entity User{
    test :: Int
  }