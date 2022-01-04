//Function with name "loggedIn" and argument types

application test

define page root() {}

function loggedIn(){}

entity User { name :: String} 

principal is User with credentials name
