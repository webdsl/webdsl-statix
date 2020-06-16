application entity_property_propkinds_and_sorts

  entity Ent1 {
    // propkinds with entities
    pke1 : Ent1
    pke2 :: Ent1 //error: Expected simple type
    pke3 -> Ent1
    pke4 <> Ent1

    // propkinds with collections of entities
    pkce1 : List<Ent1>
    pkce2 :: List<Ent1> //error: Expected simple type
    pkce3 -> List<Ent1>
    pkce4 <> List<Ent1>
    pkce5 : Set<Ent1>
    pkce6 :: Set<Ent1> //error: Expected simple type
    pkce7 -> Set<Ent1>
    pkce8 <> Set<Ent1>

    // propkinds with simple sorts
    pkss1 : String
    pkss2 :: String
    pkss3 -> String //error: Expected reference or composite type
    pkss4 <> String //error: Expected reference or composite type

    // propkinds with collections of simple sorts
    pkcss1 : List<String> //error: Expected collection of entity types
    pkcss2 :: List<String> //error: Expected collection of entity types
    pkcss3 -> List<String> //error: Expected collection of entity types
    pkcss4 <> List<String> //error: Expected collection of entity types
    pkcss5 : Set<String> //error: Expected collection of entity types
    pkcss6 :: Set<String> //error: Expected collection of entity types
    pkcss7 -> Set<String> //error: Expected collection of entity types
    pkcss8 <> Set<String> //error: Expected collection of entity types

    // propkinds with disallowed sorts
    pkds1 : Null  //error: Attribute type Null not allowed
    pkds2 :: Null //error: Attribute type Null not allowed
    pkds3 -> Null //error: Attribute type Null not allowed
    pkds4 <> Null //error: Attribute type Null not allowed
    pkds5 : Void  //error: Attribute type Void not allowed
    pkds6 :: Void //error: Attribute type Void not allowed
    pkds7 -> Void //error: Attribute type Void not allowed
    pkds8 <> Void //error: Attribute type Void not allowed

    // propkinds with disallowed ref sorts
    pkdrs1 : ref Ent1 // error: Reference type is not allowed in attribute
    pkdrs2 : Ref<Ent1> // error: Reference type is not allowed in attribute
    pkdrs3 :: ref String // error: Reference type is not allowed in attribute
    pkdrs4 -> ref Ent1 // error: Reference type is not allowed in attribute
    pkdrs5 <> Ref<String> // error: Reference type is not allowed in attribute

    // disallowed names
    id : String // error: Cannot override the builtin property 'id'
    version : String // error: Cannot override the builtin property 'version'
    created : String // error: Cannot override the builtin property 'created'
    modified : String // error: Cannot override the builtin property 'modified'
    class : String // error: Cannot use the reserved property name 'class'

    // prop kinds with collections of collections
    pkcc1 : List<List<Ent1>> // error: Expected collection of entity types
    pkcc2 :: List<List<Ent1>> // error: Expected collection of entity types
    pkcc3 -> List<List<Ent1>> // error: Expected collection of entity types
    pkcc4 <> List<List<Ent1>> // error: Expected collection of entity types

    // generic built-ins
    gb1 : List<Void> // error
    gb3 : List<Entity> // error

    //built-ins
    b1 : TemplateElements // error
  }
