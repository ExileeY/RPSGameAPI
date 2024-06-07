require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { described_class.new }

  describe 'attributes' do
    it { is_expected.to respond_to(:uuid) }
    it { is_expected.to respond_to(:user_choice) }
    it { is_expected.to respond_to(:computer_choice) }
  end
end
