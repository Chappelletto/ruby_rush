# encoding: utf-8
#
# Программа, выбрасывающая значение от 1 до 6 — одну игральную кость, версия 3.
# Кость вращается при броске.
#
# (с) rubyrush.ru

# Напишем метод, который показывает вращающийся кубик. Для этого 100 раз с
# задержкой в 1 сотую секунды покажем произвольное число и сотрём её потом,
# добавив \r в конце.
def show_rolling_die
  100.times do
    # Вместо puts используем print, т.к. он не добавляет перенос строки в конце
    print "#{rand(6) + 1}\r"
    sleep 0.01
  end
end

puts 'How many dice?'
number = gets.to_i
puts

number.times do
  # Вызываем метод вращения кубика
  show_rolling_die
  puts rand(6) + 1
end