require 'psych'

class My_utilities
  def self.convert_to_yaml(file_name, library_object)
    begin
      f = File.open(file_name, 'w')
      Psych.dump(library_object, f)
      f.close
      true
    rescue
      puts 'ERROR: File did not write.'
    end
  end

  def self.convert_from_yaml(file_name)
    begin
      f = File.open(file_name, 'r')
      return_object = Psych.load(f)
      f.close
      return_object
    rescue
      puts 'ERROR: File did not read.'
    end
  end
end
