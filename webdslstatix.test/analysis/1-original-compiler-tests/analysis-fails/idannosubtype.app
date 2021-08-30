//Id annotation not allowed in subtypes

application test

  page root { }

section datamodel

  entity SuperUser {
    fullname :: String
  }
  entity User : SuperUser {
    name :: String (id)
  }
