class Game

	def initialize(slovo)
		@letters = get_letters(slovo)

		@errors = 0

		@good_letters = []
		@bad_letters = []

		@status = 0
	end


	# 1. спросить букву с консоли
	# 2. Проверить результат
	def get_letters(slovo)
		if slovo == nil || slovo == ''
    		abort 'Для игры введите загаданное слово в качестве аргумента при ' \
      		'запуске программы'
  		end
  		return slovo.encode('UTF-8').split('')
	end

	def ask_next_letter
		letter = ''
		if Gem.win_platform?
  		Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  		Encoding.default_internal = __ENCODING__

  			[STDIN, STDOUT].each do |io|
   			 io.set_encoding(Encoding.default_external, Encoding.default_internal)
  			end
		end
	  	# В цикле будем опрашивать юзера, пока он не введет что-нибудь
	  	while letter == ''
	    # Спрашиваем у пользователя букву в консоли. Обратите внимание, что вместо
	    # gets надо использовать STDIN.gets — особенность руби при использования
	    # аргументов в командной строке (массива ARGV).
	    	letter = STDIN.gets.encode('UTF-8').chomp
	  	end

		next_step(letter)
	end

	def next_step(bukva)
		if @status == -1 || @status == 1
			return
		end

		if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
			return			
		end

		if @letters.include?(bukva)

			@good_letters << bukva

			if @good_letters.size == @letters.uniq.size
				@status = 1
			end

		else
			@bad_letters << bukva

			@errors += 1

			if @errors >= 7
				@status = -1
			end
		end
	end

	def letters
		@letters		
	end

	def good_letters
		@good_letters		
	end

	def bad_letters
		@bad_letters
	end

	def status
		@status
	end

	def errors
		@errors		
	end
end