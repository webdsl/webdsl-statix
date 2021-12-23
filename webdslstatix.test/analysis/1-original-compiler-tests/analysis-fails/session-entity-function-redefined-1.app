//Function with signature dup(Int, String) of entity "User" is defined multiple times.

application test

  page root { }

  session user{
    name :: String
    function dup(a:Int,b:String):String
    {
      return b;
    }
  }
  
  extend session user{
    number :: Int
    function dup(a:Int,b:String):String
    {
      return "test";
    }
  }
