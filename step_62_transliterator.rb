# Введите фразу для транслитерации:
# Отличный ёж
# Otlichnyy yezh

require 'cyrillizer'

# Перед работой надо настроить гем на русский язык
Cyrillizer.language = 'russian'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# Просим пользователя ввести фразу для транслитерации и сохраняем то, что ввел
# пользователь в переменную string. На случай, если он вводит русские символы,
# в Windows, сконвертируем все в кодировку UTF-8.
puts 'Введите фразу для транслитерации:'
string = gets.encode('UTF-8').chomp

string_lat = string.to_lat

if string == string_lat
  # Если string_lat совпадает с исходной строкой string, значит, введенная фраза
  # была на английском и выводим результат транслитерации в кирилицу.
  # выводим результат работы метода to_lat
  puts string.to_cyr
else
  # Иначе, вывоим транслитерированную эту фразу на английском
  puts string_lat
end