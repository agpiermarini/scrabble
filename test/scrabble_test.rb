gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    #skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_two_letters
    scrabble = Scrabble.new

    assert_equal 3, scrabble.score("ag")
  end

  def test_it_can_score_more_than_two_letters
    scrabble = Scrabble.new

    assert_equal 13, scrabble.score("Justin")
    assert_equal 10, scrabble.score("Bieber")
  end

  def test_it_returns_0_for_nil
    scrabble = Scrabble.new

    assert_nil nil, scrabble.score(nil)
  end

  def test_it_returns_0_for_empty_string
    scrabble = Scrabble.new

    assert_nil nil, scrabble.score("")
  end

  def test_it_can_score_one_letter_with_a_multiplier
    scrabble = Scrabble.new

    assert_equal 16, scrabble.score_with_multipliers("J", [2])
  end

  def test_it_can_score_multiple_letters_with_a_multiplier
    scrabble = Scrabble.new

    assert_equal 23, scrabble.score_with_multipliers("Justin", [2, 1, 1, 2, 1, 2])
  end

  def test_it_can_add_bonus_multiplier
    scrabble = Scrabble.new

    assert_equal 22, scrabble.bonus_multiplier("table", [1, 2, 2, 1, 1], 2)
  end

  def test_it_can_add_10_points_for_long_words
    scrabble = Scrabble.new

    assert_equal 10, scrabble.length_bonus("Justins")
    assert_equal 0, scrabble.length_bonus("Bieber")
  end

  def test_it_can_score_word_with_multiplier_and_bonus
    scrabble = Scrabble.new

    assert_equal 46, scrabble.score_with_multipliers("Justin", [2, 1, 1, 2, 1, 2, 1], 2)
    assert_equal 58, scrabble.score_with_multipliers("Justins", [2, 1, 1, 2, 1, 2, 1], 2)
  end

  def test_it_can_determine_whether_bonus
    scrabble = Scrabble.new

    assert_equal 10, scrabble.length_bonus("Justins")
  end

  def test_it_returns_highest_scoring_word
    scrabble = Scrabble.new

    assert_equal "home", scrabble.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_it_returns_shorter_word_if_tied
    #skip
    scrabble = Scrabble.new

    assert_equal "word", scrabble.highest_scoring_word(['hello', 'word', 'sound'])
  end
end
