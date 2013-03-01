class Library_runner
  require_relative('../main/my_library')
  require_relative('../main/book')
  require_relative('../main/person')

  b1 = Book.new('War And Peace')
  b2 = Book.new('Great Expectations')
  b1.author = 'Tolstoy'
  b2.author = 'Dickens'
  jim = Person.new
  sue = Person.new
  jim.name = 'Jim'
  sue.name = 'Sue'
  test_library = My_library.new('Test Drive Library')

  test_library.add_book(b1)
  test_library.add_book(b2)
  test_library.add_person(jim)
  test_library.add_person(sue)
  test_library.add_person(jim)

  puts 'Just created new library - Tutorial'
  test_library.print_status
end