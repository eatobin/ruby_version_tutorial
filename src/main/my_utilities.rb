class My_utilities
  def self.get_string_from_file(file_name)
    f = File.open(file_name, 'r')
    f.read
  end

  def self.save_string_to_file(file_name, saved_string)
    f = File.open(file_name, 'w')
    f.puts saved_string
    f.close
    true
  end
end
