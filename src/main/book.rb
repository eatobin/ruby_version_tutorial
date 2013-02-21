class Book

  attr_accessor(:author)
  attr_reader(:title)

  def initialize(title)
    @title = title
    @author = 'unknown author'
  end
end
