# Класс Родитель
class Parent
  # Метод name будет возвращать имя экземпляра класса. Этот метод унаследуют
  # дети, поэтому они смогут ответить, как их зовут.
  attr_reader :name

  # Конструктор родительского класса унаследуется детьми. Детей можно будет
  # создавать также, как родителей, передавая им имя.
  def initialize(name)
    @name = name
  end

  # У родителя метод obedient возвращает true
  def obedient
    true
  end
end