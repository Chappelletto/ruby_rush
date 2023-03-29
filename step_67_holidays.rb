# encoding: utf-8

# Получим объект с текущим моментом с помощью метода now класса Time.
time = Time.now

# Вытащим из этого объекта день недели (не забывайте, что отсчитываются они от
# воскресенья)
wday = time.wday

# Если сейчас воскресенье или суббота — можно сразу написать об этом
# пользователю и завершить программу.
if wday == 0 || wday == 6
  puts 'Сегодня выходной!'
  exit
end

# Если не суббота и не воскресенье — всё сложнее. Открываем файл со списком
# государственных праздников. Составить такой список можно, например, посетив
# вот этот сайт:
#
# http://www.consultant.ru/law/ref/calendar/proizvodstvennye/
file_path = File.dirname(__FILE__) + '/data/holidays.txt'
file = File.new(file_path, 'r:UTF-8')

# Сохраняем праздники в массив и закрываем файл
holidays = file.readlines
file.close

# Удаляем символ переноса строки из каждого элемента, отрезая последний символ
for day in holidays
  day.chomp!
end

# Используя метод strftime экземпляра класса Time, запишем в переменную date
# текущую дату.
date = time.strftime('%d.%m')

# Проверяем, есть ли в массиве праздников сегодняшняя дата
if holidays.include?(date)
  # Если есть — сегодня праздник
  puts 'Сегодня государственный праздник'
else
  # В противном случае придётся идти на работу
  puts 'Сегодня будний день, за работу!'
end