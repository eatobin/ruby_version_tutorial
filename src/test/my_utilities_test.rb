require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyUtilitiesTest < Test::Unit::TestCase
  def test_1_convert_to_yaml
    save_file = '../../saveyaml.yml'
    @@b1 = Book.new('Book1')
    @@p1 = Person.new
    @@p1.name = 'Fred'
    @@ml = My_library.new('Test Library')
    @@ml.add_book(@@b1)
    @@ml.add_person(@@p1)
    @@ml.check_out(@@b1, @@p1)

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
