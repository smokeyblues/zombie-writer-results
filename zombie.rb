require 'zombie_writer'

#I like to use the smarter_csv gem as my CSV parser. It's a personal taste of mine.

require 'smarter_csv'

zombie = ZombieWriter::MachineLearning.new

array_of_paragraphs = SmarterCSV.process("nanogenmo.csv")

array_of_paragraphs.each do |paragraph|
  zombie.add_string(paragraph)
end

array = zombie.generate_articles

File.open("articles.md", "w+") do |f|
  array.each { |article| f.puts("#{article}\n- - -\n\n") }
end
