require 'active_support/core_ext/object/try' 
require 'action_view'


file = File.open("qs_topicwise_dump.tsv", "w")

file.puts "Topic_Code \t Chapter \t Topic \t Q Size \t Sol Size \t Difficulty \t Code \t Status \t Problem ID \t Text \t A \t B \t C \t D" 

Syllabus.all.select{|s| s.curriculum.present?}.each do |s|
	s.chapters.each do |c|
		c.topics.each do |top|
			top.problems.where(type: "Test").each do |p|
				if (p.options[1].present?)

					row = [
						top.code,
						c.name,
						top.name, 
						p.text.size,
						p.solution.size,
						p.difficulty_rating,
						#p.answer,						# Q can have multiple correct answers leading to text overflow
						# p.tests.first.code,
						p.code,
						p.review_status,
						p.id,							# For generating Q links on CMS
						Rails::Html::FullSanitizer.new.sanitize(p.text),
						Rails::Html::FullSanitizer.new.sanitize(p.options[0].text),
						Rails::Html::FullSanitizer.new.sanitize(p.options[1].text),
						Rails::Html::FullSanitizer.new.sanitize(p.options[2].text),
						Rails::Html::FullSanitizer.new.sanitize(p.options[3].text)
						]
					puts row.join("\t")
					file.puts row.join("\t")
			
				end
			end
		end
	end
end

file.close