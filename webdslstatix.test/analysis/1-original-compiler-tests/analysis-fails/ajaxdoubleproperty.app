//Properties are defined multiple times
application test

section pages

define page root() {
  block[id:="x", id:="y"] { "z" }
}
