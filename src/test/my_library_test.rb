require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyLibraryTest < Test::Unit::TestCase
  def setup
    @@b1 = Book.new('Book1')
    @@b2 = Book.new('Book2')
    @@b3 = Book.new('Book3')
    @@p1 = Person.new
    @@p2 = Person.new
    @@p1.name = 'Fred'
    @@p2.name = 'Sue'
    @@ml = My_library.new('Test Library')
  end

  def test_my_library
    assert_equal('Test Library', @@ml.name)
    assert_true(@@ml.books.instance_of?(Array))
    assert_true(@@ml.people.instance_of?(Array))
  end

  def test_add_and_delete_book
    assert_equal(0, @@ml.books.length)

    @@ml.add_book(@@b1)
    @@ml.add_book(@@b2)
    assert_equal(2, @@ml.books.length)
    assert_equal(0, @@ml.books.index(@@b1))
    assert_equal(1, @@ml.books.index(@@b2))

    # Try to add a duplicate book (@@b1) - should reject
    @@ml.add_book(@@b1)
    assert_equal(2, @@ml.books.length)

    @@ml.delete_book(@@b1)
    assert_equal(1, @@ml.books.length)
    assert_equal(0, @@ml.books.index(@@b2))

    # Try to delete a never-added book (@@b3) - should reject
    @@ml.delete_book(@@b3)
    assert_equal(1, @@ml.books.length)

    @@ml.delete_book(@@b2)
    assert_equal(0, @@ml.books.length)
  end

  def test_add_person
    @@ml.add_person(@@p1)
    @@ml.add_person(@@p2)
    assert_equal(2, @@ml.people.length)

    # Try to add a duplicate person (@@p1) - should reject
    @@ml.add_person(@@p1)
    assert_equal(2, @@ml.people.length)
  end

  def test_get_available_books
    @@p1.maximum_books = 1
    @@ml.add_book(@@b1)
    @@ml.add_book(@@b2)
    @@ml.add_book(@@b3)
    @@ml.add_person(@@p1)
    @@ml.add_person(@@p2)
    assert_equal(3, @@ml.get_available_books.length)
    assert_equal(1, @@ml.get_available_books.index(@@b2))
    assert_not_nil(@@ml.check_out(@@b1, @@p1))
    assert_equal(2, @@ml.get_available_books.length)
    assert_equal(1, @@ml.get_books_for_person(@@p1).length)
    assert_nil(@@ml.check_out(@@b2, @@p1))
    assert_equal(2, @@ml.get_available_books.length)
    assert_equal(1, @@ml.get_books_for_person(@@p1).length)
    assert_nil(@@ml.check_out(@@b1, @@p2))
    assert_equal(2, @@ml.get_available_books.length)
    assert_equal(0, @@ml.get_books_for_person(@@p2).length)
    assert_not_nil(@@ml.check_out(@@b2, @@p2))
    assert_equal(1, @@ml.get_available_books.length)
    assert_equal(1, @@ml.get_books_for_person(@@p2).length)
    assert_equal(0, @@ml.get_available_books.index(@@b3))
    assert_not_nil(@@ml.check_out(@@b3, @@p2))
    assert_equal(0, @@ml.get_available_books.length)
    assert_equal(2, @@ml.get_books_for_person(@@p2).length)
  end
end
