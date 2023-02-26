# encoding: utf-8
#
# Тест взят с сайта Синтона
# http://www.syntone-spb.ru/library/article_syntone/content/4786.html

version = "Тест \"Ревнивы ли вы\". Версия 0.4. (с) rubyrush.ru\n\n"

# Первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0]

# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform? && ARGV[0]
  name = name.encode('UTF-8')
end

# Если пользователь забыл передать аргумент, нам все равно надо его как-то
# называть. Проверим, если в name лежит nil (то есть пользователь ничего не
# указал), запишем туда строку 'Таинственная персона'
if name == nil
  name = 'Таинственная Персона'
elsif name == '-v'
  # Если пользователь хочет только выяснить версию программы или просто
  # убедиться, что она работает, выводим информацию о программе и выходим.
  puts version
  exit
end

# Объявим массив вопросов и запишем в перменную questions
questions = [
  'Если ваш партнер бросает взгляд на незнакомую женщину, вы устраиваете ' \
  'ему скандал прямо на улице?',
  'Если ваш партнер опаздывает на ужин, вы уверены, что он был с другой?',
  'Вы расспрашиваете его о работе, о коллегах?',
  'Вы считаете, что каждую свободную минуту должны проводить вместе?',
  'Он для вас — свет в окошке?',
  'Случается ли вам проверять его корреспонденцию и рыться в его вещах?',
  'Чем чаще он говорит о своих чувствах, тем меньше вы верите?',
  'Вы хотите, чтобы он интересовался только тем, чем интересуетесь вы?',
  'Вы всегда спрашиваете у него, куда он ходит и с кем встречается?',
  'Если вы на него обижены, то молчите по нескольку дней?',
  'Вас мучают мысли о его бывшей возлюбленной?',
  'Он утверждает, что не ревнует вас, потому что доверяет. Для вас это ' \
  'означает, что любовь прошла?'
]

# Создадим массив результатов теста и запишем его в переменную results
results = [
  # 10 и более ответов «да»
  'Вы болезненно ревнивы. Не думайте, что если избранник вас любит, ' \
  'то он автоматически становится вашей собственностью. Вы считаете себя ' \
  'непривлекательной и боитесь, что он бросит вас ради какой нибудь ' \
  'красавицы. Вы ни в чем не уверены, особенно в нем. Задумайтесь над этим, ' \
  'потому что нельзя быть настолько ревнивой и агрессивной, это может ' \
  'привести к конфликтам и даже к разрыву отношений.',
  # 5–9 ответов «да»
  'Ваша ревность действует на вас мобилизующе, но не она одна управляет ' \
  'вашим поведением. В минуту слабости случается и вам устраивать скандалы. ' \
  'Но, успокоившись, вы понимаете, что для вашей ревности не было никаких ' \
  'оснований.',
  # Менее 5 ответов «да»
  'Вам совершенно незнакомо чувство ревности. Но тревога и беспокойство ' \
  'могут накапливаться со временем.Вы должны решать волнующие вас проблемы ' \
  'со своим партнером.'
]

# Приветствуем пользователя (надо же нам его расположить к себе, чтобы он
# честно отвечал на вопросы :)
#
# Обратите внимание на конструкцию вида #{...} внутри строки. Это другой способ
# вставить значение переменной в строку.
#
# "Bla-bla-bla #{name} бла-бла"
#
# Равнозначно записи:
#
# "Bla-bla-bla " + name + " бла-бла"
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько " \
  'вопросов, чтобы узнать кое-что о себе.'

# Объявим переменную, yes_answers в которой будем считать количество
# ответов "да" на вопросы теста. Начальное значение, очевидно, ноль.
yes_answers = 0

# Сделаем цикл по всему массиву questions — каждый вопрос по очереди запишется
# в переменную question, которой мы и пользуемся в цикле
for question in questions do
  # Выводим на экран текущий вопрос на экран
  puts question

  # Объявляем переменную, куда будем сохранять ответ пользователя, прочитанный
  # из консоли. Мы будем делать цикл с условием по этой переменной, поэтому ее
  # нужно определить до цикла.
  user_input = nil

  # Цикл, повторяющий просьбу ввести ответ до тех пор, пока не будет введен один
  # из двух возможных вариантов, 'yes' или 'now'. Начальное значение user_input
  # nil, значит тело цикла выполнится как минимум один раз.
  until user_input == 'yes' || user_input == 'no'
    # Просим пользователя ввести в консоли 'yes' или 'no'
    puts 'Введите \'yes\' или \'no\' и нажмите Enter'

    # Результат, считанный с консоли методом 'gets', избавляем от перевода
    # строки в конце методом 'chomp' и сразу приводим в нижний регистр методом
    # 'downcase'. Цепочка методов gets -> chomp -> downcase выполняется слева
    # направо и результат последнего метода запишется в uset_input.
    user_input = STDIN.gets.chomp.downcase

    # Это эквивалентно:
    #
    # input = gets
    # input_no_endline = input.chomp
    # user_input = input_no_endline.downcase
  end

  if user_input == 'yes'
    # Если пользователь ответил утвердительно, увеличиваем значение переменной
    # yes_answers на единицу
    yes_answers += 1
  end

  # Переходим к следующему вопросы, тело цикла начинается с начала.
  # Так будет происходить, пока не кончатся вопросы.
end

# Выводим имя пользователя, количество ответов "yes" (да) и результат теста
# в зависимости от количества утвердиетльных ответов.
puts "\n#{name}"
puts "\nВаш результат теста (ответов 'да' - #{yes_answers}):"

if yes_answers >= 10
  puts results[0]
elsif yes_answers >= 5
  puts results[1]
else
  puts results[2]
end

# Другие способы пройтись по всем элементам массива:
#
# Универсальный способ:
#
# i = 0
# length = questions.length
#
# while i < length do ...
#   # Внутри цикла выбираем элемент массива questions[i], после чего
#   # увеличиваем значение i на единицу — т. е. в следующем шаге цикла
#   # будет выбран следующий элемент массива
#   question = questions[i]
#   i += 1
# end
#
# Как вы видите, для простого действия пришлось написать очень много кода.
# А вот способ, которым бы эту задачу решил настоящий ruby-разработчик,
# используя встроенный в массив метод 'each':
#
# questions.each do |question|
#   # В переменной question уже лежит текущий элемет массива questions
# end
#
# Круто, не так ли?!
#
# Другие способы (тысячи их) можно посмотреть тут:
#
# http://bit.ly/2kJ0CZj