//Property "name" of entity "XYZ" is defined multiple times
application test

  entity XYZ {
    name :: String
    name :: Int
  }

 define page root() {
    "default body"
  }
