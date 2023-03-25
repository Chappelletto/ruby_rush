#encoding: utf-8

questions_path = 'data/questions.txt'
answers_path = 'data/answers.txt'


# Если какого-то файла нет, выходим и сообщаем об этом пользователю
unless File.exist?(answers_path) && File.exist?(questions_path)
  abort 'Один из файлов не найден!'
end


# Открываем файл c вопросами, считываем вопросы в массив questions и закрываем
# файл. Аналогично, считываем все ответы в массив answers. Убедитесь, что вы
# сохранили файлы questions.txt и answers.txt в нужной кодировке.
questions_file = File.new(questions_path, 'r:UTF-8')
questions = questions_file.readlines
questions_file.close

answers_file = File.new(answers_path, 'r:UTF-8')
answers = answers_file.readlines
answers_file.close

user_answer = ""
current_index = 0
correct_answers = 0

while current_index < questions.size 
	puts questions[current_index]

	user_answer = STDIN.gets.encode('UTF-8').chomp
	correct_answer = answers[current_index].chomp
	puts correct_answer

	if	user_answer == correct_answer 
		puts "Правильно!"
		correct_answers += 1
	else 
		puts "Неверно! Правльный ответ: #{correct_answer}"
	end

	current_index += 1
end

#Вывод 
puts 
puts "Правильных ответов: #{correct_answers} из #{questions.size}"



