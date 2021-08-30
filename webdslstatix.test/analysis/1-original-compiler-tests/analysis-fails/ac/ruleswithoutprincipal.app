//cannot have access control rules without a principal declaration
application test

  page root { }

access control rules

  rule page root()
  {
    true
  }