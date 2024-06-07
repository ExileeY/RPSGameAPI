require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { described_class.new }

  describe 'attributes' do
    it { is_expected.to respond_to(:uuid) }
    it { is_expected.to respond_to(:user_choice) }
    it { is_expected.to respond_to(:computer_choice) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_inclusion_of(:user_choice).in_array(Game::CHOICES) }
    it { is_expected.to validate_inclusion_of(:computer_choice).in_array(Game::CHOICES) }
  end
end
