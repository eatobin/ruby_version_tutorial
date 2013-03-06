require 'yaml'

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

  def self.convert_to_yaml(file_name, library_object)
    begin
      f = File.open(file_name, 'w')
      YAML.dump(library_object, f)
      f.close
      true
    rescue
      puts 'ERROR: File did not write.'
    end
  end

  def self.convert_from_yaml(file_name)
    begin
      f = File.open(file_name, 'r')
      return_object = YAML.load(f)
      f.close
      return_object
    rescue
      puts 'ERROR: File did not read.'
    end
  end

  #def self.save_my_library_to_yaml_file(file_name, my_library)
  #  self.save_string_to_file(file_name, self.convert_to_yaml(my_library))
  #end
  #
  #def self.get_my_library_from_yaml_file(file_name)
  #  self.convert_from_yaml(self.get_string_from_file(file_name))
  #end
end
