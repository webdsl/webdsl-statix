//predicate should contain a Bool expression
application test

  page root { }

section predicate

entity User { name :: String }

principal is User with credentials name

predicate foo(i:Int){
  i
}