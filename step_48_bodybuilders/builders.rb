require "./body_builders.rb"

builder_1 = BodyBuilder.new
builder_2 = BodyBuilder.new
builder_3 = BodyBuilder.new


4.times do 
	builder_1.pump("biceps")
end

3.times do 
	builder_1.pump("triceps")
end

7.times do 
	builder_1.pump("delta")
end

3.times do
	builder_2.pump("biceps")
end

6.times do
	builder_2.pump("delta")
end

5.times do 
	builder_2.pump("triceps")
end

10.times do
	builder_3.pump("biceps")
end

7.times do 
	builder_3.pump("triceps")
end

6.times do 
	builder_3.pump("delta")
end


puts "Первый бодибилдер:"
builder_1.stat
puts

puts "Второй бодибилдер"
builder_2.stat
puts
puts "Третий бодибилдер"
builder_3.stat
puts


