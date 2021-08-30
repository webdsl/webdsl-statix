//does not exist

application test

  page root { }
 
 entity Test {
   test2 -> Test2 (inverse=Test2.tes)
 } 
 
 entity Test2{
   test -> Test
 }