application HelloWorld

entity Item {
  text : WikiText
}

page root {
  var newitem := Item{}
  form {
    input( newitem.text )
    submit action{ newitem.save(); }{ "Add text" }
  }
  div {
    output( (from Item).length )
  }
  for( i: Item ){
    div {
      output( i.text )
      submit action{ i.delete(); }{ "Remove" }
    }
  }
}