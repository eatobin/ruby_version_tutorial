class My_utilities
  def self.get_string_from_file(file_name)
    begin
      f = File.open(file_name, 'r')
      f.read
    rescue
      puts 'ERROR: File did not read.'
    end
  end

  def self.save_string_to_file(file_name, saved_string)
    begin
      f = File.open(file_name, 'w')
      f.puts saved_string
      f.close
      true
    rescue
      puts 'ERROR: File did not write.'
    end
  end
end
