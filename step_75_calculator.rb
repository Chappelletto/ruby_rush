puts "Введите первое число:"

number_1 = STDIN.gets.encode('UTF-8').chomp

puts "Введите второе число:"

number_2 = STDIN.gets.encode('UTF-8').chomp

puts  "Выберите операцию (+ - * /):"

operation = STDIN.gets.encode('UTF-8').chomp


case operation
when "+"
	puts number_1.to_i + number_2.to_i
when "-"
	puts number_1.to_i - number_2.to_i
when "*"
	puts number_1.to_i * number_2.to_i
when "/"
	begin
		puts number_1.to_i / number_2.to_i
	rescue ZeroDivisionError
		puts "На ноль делить нельзя"
	end
else
	puts "Неправильная операция"
end