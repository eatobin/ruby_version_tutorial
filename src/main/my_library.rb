class My_library
  attr_reader(:name)
  attr_accessor(:books, :people)

  def initialize(name)
    @name = name
    @books = Array.new
    @people = Array.new
  end

  def add_book(b1)
    unless @books.include?(b1)
      @books.push(b1)
    end
  end

  def delete_book(b1)
    if @books.include?(b1)
      @books.delete(b1)
    end
  end

  def add_person(p1)
    unless @people.include?(p1)
      @people.push(p1)
    end
  end

  def to_s
    self.name + ': ' + self.books.length.to_s + ' books; ' + self.people.length.to_s + ' people.'
  end

  ary = [1, 2, 3, 4, 5]
  ary.each do |i|
    puts i
  end
end
