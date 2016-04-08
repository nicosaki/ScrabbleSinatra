module Scrabble
class Scoring
  attr_reader :word, :score
  def initialize(word)
    @word = word
  end

    LETTER_SCORES = {"a"=>1, "b"=>3, "c"=>3, "d"=>2, "e"=>1, "f"=>4, "g"=>2,
      "h"=>4, "i"=>1, "j"=>8, "k"=>5, "l"=>1, "m"=>3, "n"=>1, "o"=>1, "p"=>3,
      "q"=>10, "r"=>1, "s"=>1, "t"=>1, "u"=>1, "v"=>4, "w"=>4, "x"=>8, "y"=>4,
      "z"=>10}

      def self.letter_by_letter(word)
        letters = word.chars
        letter_array = []
        letter_score_array = []
        letters.each do |letter|
          letter_array << letter
          letter_score_array << LETTER_SCORES[letter].to_s
        end
        return [letter_array, letter_score_array] #array of letters, equivalent array of scores INDEX TO MATCH
      end


      def self.score(word) # takes a string
        return 0 if word.empty? # empty string/pass

        score = 0

        #Add bonus for word_length corner case.
        score = 50 if word.length == 7

        split_word = word.downcase.split('') # downcase for comparing

        split_word.each do |letter|
          score += LETTER_SCORES[letter]
        end
        hash = {}
        by_letters = self.letter_by_letter(word)
        by_letters << score
        hash[word] = by_letters
        return  hash #hash {word: [letters][scores]}
      end

    def self.score_many(words)
      words = words.downcase.gsub(/[^[:word:]\s]/, '') #in case of stupid
      words = words.split(" ")
      scores_hash = {}
      words.each do |word|
        # scores_hash[word] =
        # label = word + "_by_letter"
        scores_hash[word] = self.score(word)[word] #hash[word_by_letter] = [[letters], [scores]]
      end
      return scores_hash
    end

end
end
