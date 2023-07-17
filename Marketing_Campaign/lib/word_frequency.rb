def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  hash = Hash.new { |h, k| h[k] = 0 }
  forbiddenwords = []
  allwords = []
  File.open(stop_words_file_name, "r").each_line do |line|
    # Do something with the line variable
    line.gsub!(/\W/, " ").split.each { |word| forbiddenwords << word.downcase }
  end
  forbiddenwords.uniq!.sort
  File.open(file_name, "r").each_line do |line|
    # Do something with the line variable
    line.gsub!(/\W/, " ").split.each { |word| allwords << word.downcase }
  end
  finalarray = []
  allwords.each { |word| finalarray << word unless forbiddenwords.include?(word) }
  # p finalarray
  # TODO: search the three words that appears the most in finalarray
  finalarray.each do |word|
    if hash[word]
      hash[word] += 1
    else
      hash[word] = 1
    end
  end
  maxs = hash.max_by(number_of_word) { |_, v| v }
  hash = {}
  maxs.each { |array| hash[array[0]] = array[1] }
  hash
end

p most_common_words("lib/source-text.txt", "lib/stop_words.txt", 3)
