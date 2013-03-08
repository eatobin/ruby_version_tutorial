require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyUtilitiesTest < Test::Unit::TestCase
  def test_1_convert_to_yaml
    save_file = '../../saveyaml.yml'
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
    get_file = '../../saveyaml.yml'
    assert_instance_of(My_library, My_utilities.convert_from_yaml(get_file))

    # This should pass wth rescue error - file NOT read:
    get_file = '../../saveyaml/.yml'
    assert_nil(My_utilities.convert_from_yaml(get_file))
  end
end
