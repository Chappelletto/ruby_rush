# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


puts 'Введите строку с хэштегами:'

string = gets.encode('UTF-8').chomp

regexp = /#[[:word:]-]+/

hashtags = string.scan(regexp)

puts
puts 'Нашли вот такие хэштеги: ' + hashtags.join(', ')