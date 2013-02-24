class My_library
  attr_reader(:name)
  attr_accessor(:books, :people)

  def initialize(name)
    @name = name
    @books = Array.new
    @people = Array.new
  end


end