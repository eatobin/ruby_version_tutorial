require_relative('../main/my_library')
require 'test/unit'

class MyLibraryTest < Test::Unit::TestCase
  def test_my_library
    ml1 = My_library.new('Test Library')
    assert_equal('Test Library', ml1.name)
    assert_true(ml1.books.instance_of?(Array))
    assert_true(ml1.people.instance_of?(Array))
  end
end