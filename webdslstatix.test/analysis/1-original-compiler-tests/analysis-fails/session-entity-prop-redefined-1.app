//Property "name" of entity "User" is defined multiple times.

application test

  page root { }

  session user{
    name :: String
  }
  
  extend session user{
    name :: Int
  }
