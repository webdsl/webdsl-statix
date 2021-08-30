//No property naml defined for User
//No property name2 defined for User


application test

  page root { }

  entity User{
    name :: String
  }
  function a(u:User){
    u.naml;
    //var s:String := u.naml;
  }

 entity SpecialUser : User {
 	name2 :: String
 	function test() {
 		super.name2;
 	}
 }
  