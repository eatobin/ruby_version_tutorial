data = File.read("text.txt")
puts data

data = File.open("text.txt").read
puts data

File.open("text.txt").each { |line| puts line }
File.new("text.txt", "r").each { |line| puts line }

File.open("text.txt") do |f|
  puts f.gets
end

f = File.new("text.txt", "r")
puts f.gets
f.close

data = ''
File.new("text.txt", "r").each { |line| data << line }
puts data

data = ''
File.open("text.txt").each { |line| data << line }
puts data

data = File.read("ruby_o.yaml")
puts data

data = ''
File.open("ruby_o.yaml", "r").each { |line| data << line }
puts data

File.open("text2.yaml", "w") do |f|
  f.puts "--- !ruby/object:C
a_object: &id001 !ruby/object:A
  number: 5
  string: hello world
b_object: !ruby/object:B
  a_object: *id001
  number: 7"
end

File.open("skorks.yaml", "w") do |f|
  f.puts serialized_object_out
end


f = File.open("sample.txt", "r") # assume this file for the next couple of snippets
f.read # => "something\nline 2\na third\nfour!\n5555\nsixy\nsevenly\neight"
