// The expression of the derived property "authoredPapers" should have type "String"

application test

  page root { }

section datamodel

  entity User {
    authoredPapers :: String := 1
  }