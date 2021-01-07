# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
  #raise NotImplementedError # TODO
  sub = []
  words.each do |i|
    sub.append(i.downcase)
  end
  return sub
end

# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  #raise NotImplementedError # TODO
  words.map do |i|
    i = i.downcase
  end
  return words
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  #raise NotImplementedError # TODO
  same = []
  words.each do |i|
    if(i.start_with?(prefix))
      same.append(i)
    end
  end
  return same
end

# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
# 
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
  #raise NotImplementedError # TODO
  if(word_1.length > word_2.length)
    l = word_2.length
  elsif(word_2.length >= word_1.length)
    l = word_1.length
  end
  
  max = 0
  (l+1).times do |x|
    if (word_1[0,x].downcase.eql?(word_2[0,x].downcase))
      max = x
    end
  end
  return max    
end

# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.
def most_similar_words(chosen_word, words)
  #raise NotImplementedError # TODO
  max = 0
  sim = []
  words.each do |i|
    check = similarity_score(chosen_word, i)
    if(check > max)
       max = check
       sim.clear() #empty elements which have lower score
       sim.append(i) #add the newest word
    elsif(check == max)
       sim.append(i) #multiple words with same score
    end
  end
  return sim
end