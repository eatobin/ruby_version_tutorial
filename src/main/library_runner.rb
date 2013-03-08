class Library_runner
  require_relative('../main/my_utilities')
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
  puts test_library.print_status
  puts 'Check out War And Peace to Sue'
  test_library.check_out(b1, sue)
  puts test_library.print_status
  puts 'Check in War And Peace and check out Great Expectations to Jim'
  test_library.check_in(b1)
  test_library.check_out(b2, jim)
  puts test_library.print_status

  puts 'Now - Persistence!'
  My_utilities.convert_to_yaml('../../runner1.yml', test_library)

  new_my_library = My_utilities.convert_from_yaml('../../runner1.yml')

  puts new_my_library
  puts 'Printing information from the saved yaml file.'
  new_my_library
end
