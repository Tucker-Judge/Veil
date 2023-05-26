namespace :word_groups do
    desc "Find word groups in French sentences"
    task :find => :environment do
      file_path = "path/to/sentences_file.txt"  # Replace with your actual file path
      
      word_groups = Hash.new(0)
      
      File.open(file_path, "r") do |file|
        file.each_line do |line|
          sentences = line.split(/[.!?]/)
          
          sentences.each do |sentence|
            words = sentence.downcase.scan(/\w+/)
            next if words.length < 3
      
            (0..words.length - 3).each do |i|
              group = words[i..i+2].join(' ')
              word_groups[group] += 1
            end
          end
        end
      end
      
      sorted_word_groups = word_groups.sort_by { |group, count| -count }
      
      sorted_word_groups.each do |group, count|
        puts "#{group}: #{count}"
      end
    end
  end
  