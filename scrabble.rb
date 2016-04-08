require 'sinatra'
require_relative 'lib/scoring'
# require_relative 'lib/player'
# require_relative 'lib/tilebag'
# require_relative 'lib/board'

module Scrabble
  MAXIMUM_NUMBER_OF_LETTERS = 7

  class ScrabbleApp < Sinatra::Base #this or Scoring/Player??
    get '/' do
      erb :index
    end

    get '/score' do
      erb :score
    end

    post '/score' do
      (params["word_entered"] = "something") if params["word_entered"] == ""
      @new_score = Scoring.score(params["word_entered"]) #should be hash {"word" => [letters], [scores], total}
      erb :score
    end

    get '/score-many' do
      erb :'score-many'
    end

    post '/score-many' do
      @score_hash = Scoring.score_many(params["words_entered"]) #makes score
      erb :'score-many'
    end

    run!
  end

end
