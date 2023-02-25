time = Time.now
week_day = time.wday

if week_day == 6 or week_day == 7
	puts "Сегодня выходной"
else 
	puts "Сегодня не выходной! :(("
end