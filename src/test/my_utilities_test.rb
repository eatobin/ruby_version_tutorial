require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyUtilitiesTest < Test::Unit::TestCase
  def test_get_string_from_file
    get_file = '../../testgetstring.txt'
    get_string = "testing one, two\nthree\n"
    assert_equal(get_string, My_utilities.get_string_from_file(get_file))

    # This should pass wth rescue error - file NOT read:
    get_file = '../../testgetstringX.txt'
    assert_nil(My_utilities.get_string_from_file(get_file))
  end

  def test_save_string_to_file
    save_file = '../../testsavestring.txt'
    save_string = "this is test line one\nthis is test line two\n"
    assert_true(My_utilities.save_string_to_file(save_file, save_string))
    assert_equal(save_string, My_utilities.get_string_from_file(save_file))

    # This should pass wth rescue error - file NOT written:
    save_file = '../../testsavestring/.txt'
    assert_nil(My_utilities.save_string_to_file(save_file, save_string))
  end
end
