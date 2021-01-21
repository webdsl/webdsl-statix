application entity_type_compatibility

  page root { }

  entity Ent1{}
  entity Ent2 : Ent1{}
  entity Ent3 : Ent2{}

  entity Ent4{}
  entity Ent5 : Ent1{}

  function myFunc(p1 : String) {
    Ent1{} == Ent1{};
    Ent4{} == Ent4{};
    Ent1{} == Ent2{};
    Ent2{} == Ent1{};
    Ent3{} == Ent1{};
    Ent1{} == Ent3{};

    Ent1{} == Ent4{}; // should error
    Ent2{} == Ent4{}; // should error
    Ent3{} == Ent4{}; // should error
    Ent4{} == Ent1{}; // should error
    Ent4{} == Ent2{}; // should error
    Ent4{} == Ent3{}; // should error

    Ent2{} == Ent5{}; // should error
    Ent5{} == Ent2{}; // should error
  }
