//no page with signature

application test

  page root { }

section functions

define page home(i : Int) {
  init {
    goto nonexistent(i);
  }
}
