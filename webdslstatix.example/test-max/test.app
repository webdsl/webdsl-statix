application test

section test

  entity Author {
    name : String
  }

  entity MasterStudent : Author {
    thesis : Thesis
  }

  entity Thesis {
    title : String
    authors : Set<Author>

    function addAuthor(a : Author) : Void {
      
    }
  }

  function addAuthorToThesis(a : Author, t : Thesis) : Void {
    
  }

