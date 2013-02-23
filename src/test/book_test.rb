require_relative('../main/book')
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

end
