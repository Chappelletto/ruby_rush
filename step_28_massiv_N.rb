# encoding: utf-8

puts "Введите N:"

N = gets.to_i

array = []
item = 0 
sum =0

while item <= N
	array << item
	sum +=item
	item +=1
end

puts array.to_s

puts array.sum.to_s

puts "Сумма = #{sum}"

