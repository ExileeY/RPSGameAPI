class Game < ApplicationRecord
  CHOICES = %w[rock paper scissors].freeze

  CHOICES_WIN_MAP = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper'
  }.freeze

  validates :uuid, presence: true
  validates :user_choice, :computer_choice, inclusion: { in: CHOICES }

  def result
    return 'Tie!' if user_choice == computer_choice
    return 'You win!' if CHOICES_WIN_MAP[user_choice] == computer_choice
    return 'Computer wins!' if CHOICES_WIN_MAP[computer_choice] == user_choice
  end
end
