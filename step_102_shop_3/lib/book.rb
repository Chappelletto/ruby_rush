# encoding: utf-8
#
# Класс Книга
class Book < Product
  # Аналогично классу Product мы объями сеттеры и геттеры для переменных
  # экземпляра класса Book с помощью attr_accessor, чтобы их можно было менять
  # из основной программы.
  attr_accessor :title, :genre, :author

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя, чтобы тот обновил цену и остаток.
  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
