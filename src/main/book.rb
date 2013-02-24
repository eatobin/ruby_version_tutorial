class Book
  attr_accessor(:author, :person)
  attr_reader(:title)

  def initialize(title)
    @title = title
    @author = 'unknown author'
  end
end
