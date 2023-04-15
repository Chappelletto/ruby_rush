if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'rexml/document'

file_name = File.dirname(__FILE__) + '/visitka.xml'

unless File.exist?(file_name)
  abort "Извиняемся, хозяин, файлик #{file_name} не найден."
end

file = File.new(file_name)
doc = REXML::Document.new(file)

file.close

card = {}

# Обратите внимание, что ключами в нашем массиве будут не метки (как обычно), а строки
['first_name', 'second_name', 'last_name', 'phone', 'email', 'skills'].each do |field|
  card[field] = doc.root.elements[field].text
  #puts card[field]
end

puts card



# Наконец, выведем визитку в консоль
# puts "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
# puts "#{card['phone']}, #{card['email']}"
# puts "#{card['skills']}"