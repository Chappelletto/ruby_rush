# encoding: utf-8
#
# Класс Книга
class Book < Product
	def initialize(params)
		super
		@book_name = params[:book_name]	
		@book_author = params [:book_author]
		@book_genre = params [:book_genre]
	end
end