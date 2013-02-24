class My_library
  attr_reader(:name)
  attr_accessor(:books, :people)

  def initialize(name)
    @name = name
    @books = Array.new
    @people = Array.new
  end

  def add_book(b1)
    if @books.include?(b1)
      puts 'Eric Error - Book Duplicate Not Allowed!'
    else
      @books.push(b1)
    end
  end

  def delete_book(b1)
    @books.delete(b1)
  end
end