# encoding: utf-8
#
# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  # У любого экземпляра класса Товар будут как минимум две переменные — цена
  # и количество единиц товара на складе
  attr_reader :price, :amount
  attr_writer :title, :genre, :author
  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  # Родительский метод to_s возвращает строку с ценой и остатком
  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end
end