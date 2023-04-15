# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем парсер rexml и библиотеку date для эффективного использования дат
require 'rexml/document'
require 'date'


puts 'В этом сундуке хранятся ваши желания.'

#откройте файл для чтения
# Сначала получим текущее содержимое файла. И построим из него XML-структуру в
# переменной doc.
current_path = File.dirname(__FILE__)
file_name = current_path + '/wishes.xml'

file = File.new(file_name, 'r:UTF-8')
doc = nil

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => error
  # Если парсер ошибся при чтении файла, придется закрыть прогу :(
  puts 'XML файл похоже битый :('
  abort error.message
end

file.close

#  спросите у пользователя информацию,
puts 'Чего бы вы хотели?'
desire_text = gets.chomp

puts 'До какого числа вы хотите осуществить это желание? (укажите дату в формате ДД.ММ.ГГГГ)'
date = gets.chomp

# запишите её в новый тег с помощью метода doc.root.add_element


# Добавим трату в нашу XML-структуру в переменной doc

# Для этого найдём элемент expenses (корневой)
wishes = doc.elements.find('wishes').first

# И добавим элемент командой add_element. Все аттрибуты пропишем с помощью
# параметра, передаваемого в виде ассоциативного массива.
wish = wishes.add_element 'wish', {
  'date' => date #.strftime('%Y.%m.%d') # or Date#to_s
}

# А содержимое элемента меняется вызовом метода-сеттера text=
wish.text = desire_text

# Осталось только записать новую XML-структуру в файл методов write. В качестве
# параметра методу передаётся указатель на файл. Красиво отформатируем текст в
# файлике с отступами в два пробела.
file = File.new(file_name, 'w:UTF-8')
doc.write(file, 2)
file.close

puts 'Информация успешно сохранена'


#запишите всю структуру в тот же файл, открыв его уже на запись.


puts "Ваше желание в сундуке"