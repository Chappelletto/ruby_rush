# encoding utf-8

def circle_square(radius)
	#Он возвращает площадь круга, равную чилу Пи, умноженному квадрат радиуса
	return 3.14159 * radius**2 
end

puts "Введите радиус круга: "
radius = STDIN.gets.chomp.to_i


puts "Площадь круга: " + circle_square(radius).to_s

puts "Введите радиус круга: "
radius = STDIN.gets.chomp.to_i

puts "Площадь круга: " + circle_square(radius).to_s

