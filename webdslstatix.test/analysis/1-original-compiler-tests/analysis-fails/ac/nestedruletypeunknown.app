//nested rule type unknown

application test

define page root() {
}

entity User { name :: String }

principal is User with credentials name

access control rules

  rule page root()
  {
    true
    rule page dsf()
    {
      true
    }
  }
