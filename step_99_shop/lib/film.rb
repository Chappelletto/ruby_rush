# encoding: utf-8
#
# Класс Фильм
class Film < Product

	def initialize(params)
		super
		@film_name = params[:film_name]	
		@film_year = params [:film_year]
		@film_director = params [:film_director]
	end

end