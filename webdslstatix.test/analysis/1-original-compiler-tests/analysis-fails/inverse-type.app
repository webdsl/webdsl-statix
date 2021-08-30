//Inverse not allowed between types

application test

  page root { }

 entity Conference {
   proceedings      -> Set<Proceedings> (inverse=Proceedings.conference)
 }

 entity Proceedings : Collection {
   conference        :: String
 }

 entity Collection {
 
 }
