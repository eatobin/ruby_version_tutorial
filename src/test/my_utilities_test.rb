require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')
require 'test/unit'

class MyUtilitiesTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_get_string_from_file
    get_file = '../../testgetstring.txt'
    get_string = "testing one, two\nthree\n"
    assert_equal(get_string, My_utilities.get_string_from_file(get_file))
  end

  def test_save_string_to_file
    save_file = '../../testsavestring.txt'
    save_string = "this is test line one\nthis is test line two\n"
    assert_true(My_utilities.save_string_to_file(save_file, save_string))
  end
end
