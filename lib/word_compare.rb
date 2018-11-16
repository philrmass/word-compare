class WordCompare
  def hash_word(word)
    letter_hash = Hash.new()
    letters = word.split('')
    letters.each do |letter|
      if letter_hash.include?(letter)
        letter_hash[letter] = letter_hash.fetch(letter) + 1
      else
        letter_hash.store(letter, 1)
      end
    end
    letter_hash
  end

  def mutual_hash_keys
    mutual_keys = []
    word0_keys = @word0_hash.keys()
    word0_keys.each do |key|
      if @word1_hash.include?(key)
        mutual_keys.push(key)
      end
    end
    mutual_keys
  end

  def word?(word)
    (word =~ /[aeiouy]/) != nil
  end

  def anagram?()
    @word0_hash == @word1_hash
  end

  def anagram(word0, word1)
    word0 = word0.downcase()
    word1 = word1.downcase()
    if (word?(word0) & word?(word1))
      @word0_hash = hash_word(word0)
      @word1_hash = hash_word(word1)
      if anagram?()
        'These words are anagrams.'
      else
        mutual_keys = mutual_hash_keys()
        if mutual_keys.empty?()
          'These words have no letter matches and are antigrams.'
        else
          'These words NOT anagrams.'
        end
      end
    else
      'You need to input actual words!'
    end
  end
end
