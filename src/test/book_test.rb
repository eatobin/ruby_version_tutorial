require_relative('../main/book')
require 'test/unit'

class BookTest < Test::Unit::TestCase

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

  # Test book
  def test_book
    b1 = Book.new('Great Expectations')
    assert_equal('Great Expectations', b1.title)
    assert_equal('unknown author', b1.author)
  end

  # Test set new author
  def test_book_new_author
    b2 = Book.new('War And Peace')
    b2.author = 'Eric Tobin'
    assert_equal('Eric Tobin', b2.author)
  end
end