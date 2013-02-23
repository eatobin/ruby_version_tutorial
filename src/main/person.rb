class Person
  attr_accessor :name, :maximum_books

  def initialize
    @name = 'unknown name'
    @maximum_books = 3
  end

  def to_s
    self.name + ' (' + self.maximum_books.to_s + ' books)'
  end
end
