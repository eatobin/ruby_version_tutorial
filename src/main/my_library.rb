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

  def get_available_books
    result = Array.new
    @books.each do |book|
      unless book.person
        result.push(book)
      end
    end
    result
  end

  def get_books_for_person(p1)
    result = Array.new
    @books.each do |book|
      if book.person and book.person.eql?(p1)
        result.push(book)
      end
    end
    result
  end

  def check_out(b1, p1)
    books_out = self.get_books_for_person(p1).length
    unless b1.person or books_out >= p1.maximum_books
      b1.person = p1
    end
  end

  def check_in(b1)
    if b1.person
      b1.person = nil
      true
    end
  end

  def print_status
    puts 'Status report of My Library'
    puts self.to_s
    @books.each { |book| puts book }
  end
end
