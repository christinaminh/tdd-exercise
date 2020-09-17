require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    # Arrange
    hand = ['King', 'Queen']

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = ['King', 'Ace']

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = ['King', 'Queen', 'Ace']

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 21


    # Arrange, Act, Assert
    expect( blackjack_score( [10, 10, 'Ace'] ) ).must_equal 21

    expect( blackjack_score( ['Ace', 'Ace', 'Ace', 'Ace', 'Ace'] ) ).must_equal 15
  end

  it 'raises an ArgumentError for invalid cards' do
    expect{ blackjack_score([]) }.must_raise ArgumentError

    expect{ blackjack_score([2]) }.must_raise ArgumentError

    expect{ blackjack_score([2, 2, 2, 2, 2, 2]) }.must_raise ArgumentError

    expect{ blackjack_score([10, 12]) }.must_raise ArgumentError

    expect{ blackjack_score([1, 1, 1]) }.must_raise ArgumentError

    expect{ blackjack_score([2, 2, 2, "not_a_card"]) }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    expect{ blackjack_score([10, 10, 2]) }.must_raise ArgumentError

    expect{ blackjack_score([6, 7, 9]) }.must_raise ArgumentError

    expect{ blackjack_score(['Jack', 'Queen', 2]) }.must_raise ArgumentError

    expect{ blackjack_score([10, 10, 'Ace', 'Ace', 'Ace']) }.must_raise ArgumentError

    expect{ blackjack_score([10, 'King', 'Ace', 'Ace']) }.must_raise ArgumentError
  end
end
