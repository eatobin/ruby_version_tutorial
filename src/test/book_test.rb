require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class BookTest < Test::Unit::TestCase
  def test_book
    b1 = Book.new('Great Expectations')
    assert_equal('Great Expectations', b1.title)
    assert_equal('unknown author', b1.author)
  end

  def test_book_new_author
    b2 = Book.new('War And Peace')
    b2.author = 'Eric Tobin'
    assert_equal('Eric Tobin', b2.author)
  end

  def test_book_new_person
    b3 = Book.new('War And Peace And Donuts')
    p1 = Person.new
    p1.name = 'Elvis'
    p1.maximum_books = 77
    b3.person = p1

    assert_equal('Elvis', b3.person.name)
    test_string_person = 'Elvis (77 books)'
    test_string_book ='War And Peace And Donuts by unknown author; Checked out to Elvis'
    assert_equal(test_string_person, b3.person.to_s)
    assert_equal(test_string_book, b3.to_s)
  end
end
