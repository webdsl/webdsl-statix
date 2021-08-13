//Template with signature
//not defined

application templateoverloading

entity SuperClass{
  name :: String
}

entity SubClassOne : SuperClass{}
entity SubClassTwo : SuperClass{}

entity SubClassThree : SubClassOne{}

define page root(){
  var super2 := SuperClass{name := "super"};
  var sub1 := SubClassOne{name := "sub1"};
  var sub2 := SubClassTwo{name := "sub2"};

  var set := {super2};
  var list := [super2];

  temp(set) //set not allowed for list arg
  temp(list)
}

define temp(s1:List<SuperClass>){" 1 "}
