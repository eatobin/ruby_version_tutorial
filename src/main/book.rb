class Book
  attr_accessor(:author, :person)
  attr_reader(:title)

  def initialize(title)
    @title = title
    @author = 'unknown author'
  end

  def to_s
    unless person
      available = 'Available'
    else
      available = 'Checked out to ' + person.name
    end
    title + ' by ' + author + '; ' + available
  end
end
