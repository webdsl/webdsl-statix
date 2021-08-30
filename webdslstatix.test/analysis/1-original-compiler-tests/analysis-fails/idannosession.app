//Id annotation not allowed in session entities

application test

  page root { }

section datamodel

  session SuperUser {
    fullname :: String (id)
  }
