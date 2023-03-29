# encoding: utf-8
#
# Программа, которая считает в тексте количество слов из трех букв
#
# (с) rubyrush.ru

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

# Читаем файл целиком в переменную
text = File.read('data/text.txt', encoding: 'utf-8')

# Очищаем текст от знаков препинания
cleaned_text = text.gsub(/[,\(\)\.\-;:\?\!]/, '')

# Разбиваем текст на слова с помощью split

words = cleaned_text.split


regexp =  /^\S{3}$/
# Считаем слова, удовлетворяющие регулярному выражению,
# с помощью метода count
puts words.count { |w| w =~ regexp }



words_3_letter = text.scan(regexp)
puts words_3_letter

# ^ - начало строки
# \S - непробельный символ
# {3} - повторение предыдущего условия 3 раза
# $ - конец строки