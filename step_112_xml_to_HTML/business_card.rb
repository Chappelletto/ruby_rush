# encoding: utf-8

# XXX/ ���� ��� ��������� ������ ��� ������������� ������� ���� �� Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

require 'rexml/document'

current_path = File.dirname(__FILE__)
file_name = current_path + '/business_card.xml'

abort '�� ������� ����� �������' unless File.exist?(file_name)

# ��������� ���� � ������ �� ��� ����������� REXML-������
file = File.new(file_name, 'r:UTF-8')
doc = REXML::Document.new(file)
file.close

# ������ �� ����� ������� ����� ���� ����� ������� � ������� ������� ������� doc
# ��������, doc.root.elements["first_name"].text
# ������� ������� ��� ���� � ������������� ������

card = {}

# �������� ��������, ��� ������� � ����� ������� ����� �� ����� (��� ������), � ������
['first_name', 'second_name', 'last_name',
 'phone', 'email', 'skills', 'photo'].each do |field|
  card[field] = doc.root.elements[field].text
end

# ������ �������� ���� xml-���������
html = REXML::Document.new

# �������� �������� ������� ����� ���������
# ��������, ��� �������� �� ������� �����
html.add_element('html', {'lang' => 'ru'})

# ������� ������� head, � ������� � ���� meta ������ ���������
html.root.add_element('head').add_element('meta', 'charset' => 'UTF-8')

# �������, �������� ������� body, � ������� ����� ��������� ���������� ��������
body = html.root.add_element('body')

# ��������� �����
body.add_element('p').add_element('img', 'src' => card['photo'])

# ��������� ��������� � �.�.�. � ��������� ��� � ������� ������ add_text
h1 = body.add_element('h1').add_text(
  "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
)

# ��������� ��������� ����
body.add_element('p').add_text(card['skills'])
body.add_element('p').add_text("�������: #{card['phone']}")
body.add_element('p').add_text("Email: #{card['email']}")

# ���� �������� ���� ������� � ����
html_file_path = current_path + '/business_card.html'

# ��������� ��� ��� ������
file = File.new(html_file_path, 'w:UTF-8')

# ��� ������ �����, ����� ������� �����, ��� ��� �� HTML-��������
file.puts('<!DOCTYPE HTML>')

# �������, ������� ���� html-��������� � ���� � ������� ���
html.write(file, 2)
file.close