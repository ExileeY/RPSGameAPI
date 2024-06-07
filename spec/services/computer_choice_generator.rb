require 'rails_helper'

RSpec.describe ComputerChoiceGenerator do
  describe '.call' do
    subject { described_class.call }

    before do
      allow(Net::HTTP).to receive(:get_response).with(described_class::CURB_URI).and_return(stubbed_response)
    end

    context 'when the response is successful' do
      let(:stubbed_response) do
        instance_double(Net::HTTPSuccess, body: { 'statusCode' => 200, 'body' => 'rock' }.to_json)
      end

      it { is_expected.to eq('rock') }
    end

    context 'when the response is not successful' do
      let(:stubbed_response) do
        instance_double(Net::HTTPSuccess, body: { 'statusCode' => 500, 'message' => 'Ooops...' }.to_json)
      end

      it { is_expected.to be_in(Game::CHOICES) }
    end
  end
end