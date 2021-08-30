//is defined multiple times

application test

  page root { }

  
  session user{
    name :: String
  }
  
  session user{
    name :: String
    password :: Secret
  }

