//Expected: Reference type or Composite type

application test

  page root { }

section datamodel

  entity User {
    authoredPapers -> String
  }

  entity Paper {
  }