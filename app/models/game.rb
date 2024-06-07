class Game < ApplicationRecord
  CHOICES = %w[rock paper scissors].freeze

  validates :uuid, presence: true
  validates :user_choice, :computer_choice, inclusion: { in: CHOICES }
end
