require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyUtilitiesTest < Test::Unit::TestCase
  def test_1_convert_to_yaml
    save_file = '../../save_to_yaml.yml'
    @@b1 = Book.new('Book1')
    @@b1.author = 'Dr. Seuss'
    @@b2 = Book.new('Book2')
    @@b3 = Book.new('Book3')
    @@b3.author = 'I Wrote Book3'
    @@p1 = Person.new
    @@p2 = Person.new
    @@p1.name = 'Fred'
    @@p2.name = 'Sue'
    @@p2.maximum_books = 5
    @@ml = My_library.new('Test Library')
    @@ml.add_book(@@b1)
    @@ml.add_book(@@b2)
    @@ml.add_book(@@b3)
    @@ml.add_person(@@p1)
    @@ml.add_person(@@p2)
    @@ml.check_out(@@b1, @@p1)
    @@ml.check_out(@@b2, @@p2)

    assert_true(My_utilities.convert_to_yaml(save_file, @@ml))

    # This should pass wth rescue error - file NOT written:
    save_file = '../../saveyaml/.yml'
    assert_nil(My_utilities.convert_to_yaml(save_file, @@ml))
  end

  def test_2_convert_from_yaml
    get_file = '../../save_from_yaml.yml'
    @@ml2 = My_utilities.convert_from_yaml(get_file)

    assert_instance_of(My_library, @@ml2)
    assert_equal('I Wrote Book3!!', @@ml2.books[2].author)

    # This should pass wth rescue error - file NOT read:
    get_file = '../../saveyaml2.yml'
    assert_nil(My_utilities.convert_from_yaml(get_file))

    @@b4 = Book.new('Book4')
    @@ml2.add_book(@@b4)
    assert_equal('Book4', @@ml2.books[3].title)

    puts @@ml2.library_status_string
  end
end
