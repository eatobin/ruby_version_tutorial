require_relative('../main/my_utilities')
require_relative('../main/my_library')
require_relative('../main/book')
require_relative('../main/person')

  class LibraryRunner
  b1 = Book.new('War And Peace')
  b2 = Book.new('Great Expectations')
  b1.author = 'Tolstoy'
  b2.author = 'Dickens'
  jim = Person.new
  sue = Person.new
  jim.name = 'Jim'
  sue.name = 'Sue'
  test_library = MyLibrary.new('Test Drive Library')

  test_library.add_book(b1)
  test_library.add_book(b2)
  test_library.add_person(jim)
  test_library.add_person(sue)
  test_library.add_person(jim)

  puts 'Just created new library - Tutorial'
  puts test_library.library_status_string
  puts 'Check out War And Peace to Sue'
  test_library.check_out(b1, sue)
  puts test_library.library_status_string
  puts 'Check in War And Peace and check out Great Expectations to Jim'
  test_library.check_in(b1)
  test_library.check_out(b2, jim)
  puts test_library.library_status_string

  puts
  puts 'Now - Persistence!'
  file_name = '../../file_runner_output.txt'
  MyUtilities.convert_to_yaml('../../runner1.yml', test_library)
  new_my_library = MyUtilities.convert_from_yaml('../../runner1.yml')

  puts 'Printing information from the saved yaml file (object = new_my_library):'
  puts new_my_library.library_status_string

  b3 = Book.new('The Cat In The Hat')
  b3.author = 'Dr. Seuss'
  eric = Person.new
  eric.name = 'Eric'
  eric.maximum_books = 13
  new_my_library.add_book(b3)
  new_my_library.add_person(eric)
  new_my_library.check_out(b3, eric)

  puts 'Added Seuss to new_my_library and checked out to Eric (who is also new and max_books = 13):'
  puts new_my_library.library_status_string

  puts 'Saving modified new_my_library to yaml file (runner1.yml) - check it out!'
  MyUtilities.convert_to_yaml('../../runner1.yml', new_my_library)

  f = File.open(file_name, 'w')
  f.puts new_my_library.library_status_string
  f.close
  true
end
