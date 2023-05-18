class BookController < ApplicationController
  def create
    uploaded_io = params[:file]

    # Save the uploaded file to a temp file
    temp_file = Tempfile.new(['document', '.pdf'])
    temp_file.binmode
    temp_file.write(uploaded_io.read)
    temp_file.close

    # Read the text from the temp file
    text = read_pdf(temp_file.path)

    # Clean up the temp file
    temp_file.unlink

    # Split the text into an array of words
    words = text.split(/\s+|\n/)

    # Your list of words to compare with
    list = ["le", "Le", "maison","est" "un", "des"] # you might load this from a file or a database

    # Find words in the text that are not in the list
    words_not_in_list = words - list

    # Count occurrences of each word not in the list
    if words_not_in_list
      word_counts = words_not_in_list.each_with_object(Hash.new(0)) do |word, counts|
        cleaned_word = word.gsub(/[^\p{Alpha}']/, '') # removes non-letter characters
        counts[cleaned_word] += 1 unless cleaned_word.empty?
      end
      sorted_word_counts = word_counts.sort_by { |_word, count| count }.reverse.to_h
      render json: sorted_word_counts
    end
  end

  private

  def read_pdf(file)
    reader = PDF::Reader.new(file)

    text = ''
    reader.pages.each do |page|
      text += page.text
    end

    text
  end
end
