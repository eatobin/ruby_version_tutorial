class Book
  attr_accessor(:author, :person)
  attr_reader(:title)

  def initialize(title)
    @title = title
    @author = 'unknown author'
  end

  def to_s
    if person
      available = 'Checked out to ' + person.name
    else
      available = 'Available'
    end
    title + ' by ' + author + '; ' + available
  end
end
