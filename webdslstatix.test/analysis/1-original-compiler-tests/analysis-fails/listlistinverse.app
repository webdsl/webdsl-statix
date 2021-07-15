//Inverse between lists not allowed

application test

  page root { }

  entity User{
    children -> List<User>
    parents -> List<User> (inverse=User.children)
  }
