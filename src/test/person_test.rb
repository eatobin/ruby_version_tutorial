require_relative('../main/person')
require 'test/unit'

class PersonTest < Test::Unit::TestCase

  # Test person
  def test_person
    p1 = Person.new
    assert_equal('unknown name', p1.name)
    assert_equal(3, p1.maximum_books)
  end

  # Test person set name
  def test_person_set_name
    p2 = Person.new
    p2.name = 'Fred'
    assert_equal('Fred', p2.name)
  end

  # Test person set maximum books
  def test_person_set_maximum_books
    p3 = Person.new
    p3.maximum_books = 66
    assert_equal(66, p3.maximum_books)
  end

  # Test person return to_s
  def test_person_return_to_s
    p4 = Person.new
    p4.name = 'Fred Flintstone'
    p4.maximum_books = 7
    test_string = 'Fred Flintstone (7 books)'
    assert_equal(test_string, p4.to_s)
  end

end
