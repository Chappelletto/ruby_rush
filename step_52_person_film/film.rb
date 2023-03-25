#Объявили класс фильм
class Film
	# Конструктор принимает на вход два параметра: название фильма и фамилия
  	# режиссера. Значения этих параметров сохраняем в переменных @title и
  	# @director_name экземпляра класса соответственно.
	def initialize(title, director)
		@title = title
		@director = director
	end

	#Два метода-аксессора (геттера), возвращающих название фильма и режиссера
	def title
		return @title
	end

	def director
		@director  #фишка ruby
	end


end