require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { described_class.new }

  describe 'attributes' do
    subject { game }

    it { is_expected.to respond_to(:uuid) }
    it { is_expected.to respond_to(:user_choice) }
    it { is_expected.to respond_to(:computer_choice) }
  end

  describe 'validations' do
    subject { game }

    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_inclusion_of(:user_choice).in_array(Game::CHOICES) }
    it { is_expected.to validate_inclusion_of(:computer_choice).in_array(Game::CHOICES) }
  end

  describe '#result' do
    subject { game.result }

    context 'when the user and computer choices are the same' do
      let(:game) { described_class.new(user_choice: 'rock', computer_choice: 'rock') }

      it { is_expected.to eq('Tie!') }
    end

    context 'when the user wins' do
      let(:game) { described_class.new(user_choice: 'rock', computer_choice: 'scissors') }

      it { is_expected.to eq('You win!') }
    end

    context 'when the computer wins' do
      let(:game) { described_class.new(user_choice: 'rock', computer_choice: 'paper') }

      it { is_expected.to eq('Computer wins!') }
    end
  end
end
