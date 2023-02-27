require "./Person_class.rb"

name_1 = Person.new('Иван', 'Борисович', 65) 
name_2 = Person.new('Пётр', 'Дмитриевич', 30) 

# Вызываем у объектов класса Person по очереди все их методы: full_name, age,
# и old? и выводим на экран информацию на основе того, что получили.
puts name_1.full_name
puts "И ему #{name_1.age} — #{name_1.old? ? 'пожилой' : 'молодой'}"

puts name_2.full_name
puts "И ему #{name_2.age} — #{name_2.old? ? 'пожилой' : 'молодой'}"