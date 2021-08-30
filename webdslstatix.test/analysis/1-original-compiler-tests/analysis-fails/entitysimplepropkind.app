// Expected: Simple type. Encountered: Set<Paper>

application test

  page root { }

section datamodel

  entity User {
    authoredPapers :: Set<Paper>
  }

  entity Paper {
  }