//Property "test" of entity "User" is defined multiple times

application test

  page root { }

  entity SuperUser {
    test :: String
  }

  entity User : SuperUser {
    test :: Int
  }
  
  extend entity User{
  }