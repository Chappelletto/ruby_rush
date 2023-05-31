# Этот код необходим только при использовании русских букв на Windows
# if Gem.win_platform?
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__

#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

require 'json'


# Читаем содержимое файла colors.json
file = File.read("#{__dir__}/Visitka.json", encoding: 'UTF-8')
# Делаем ассоциативный массив из содержимого файла с помощью метода JSON.parse
# и записываем его в переменную visitka.
card = JSON.parse(file)

# Выводим hex-код красного цвета на экран, получая значение из ассоциативного
# массива по ключу-строке 'red'.
puts "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts card['skills']

# Обратите внимание, что по ключу-символу :red мы получим nil, т.к. при разборе
# JSON-структуры, создается ассоциативный массив с ключаеми-строками.
#
# > colors[:red]
#  => nil


# Иван А. Попов
# +7 999 100-30-20, ivan.popov@mail.ru
# Начинающий программист на Ruby