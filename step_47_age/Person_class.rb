class Person
	def initialize(man_name, father_name, age)
		@man_name = man_name
		@father_name = father_name
		@age = age
	end

 	# Объявим метод old? который будет возвращать true, если человеку больше
  	# (или ровно) 60 и false, если меньше 60. Обратите внимание, что по соглашению
  	# на конце такого метода должен быть вопросительный знак.
  	def old?
    	return @age >= 60
  	end

	 # В методе full_name нам теперь надо принять решение, как называть человека
  	def full_name
    # Мы используем наш метод old? прямо в другом методе того же класса, чтобы
    # выяснить, является ли этот человек пожилым.
    	if old?
      	# Если является, выводим его полное имя
      	return "#{@man_name} #{@father_name}"
    	else
      # Если нет, только имя, без отчества
     	return @man_name
    	end
 	end

  # Нам также потребуется геттер для возраста
  	def age
    	return @age
  	end
end