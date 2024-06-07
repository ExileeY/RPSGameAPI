require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "POST /create-or-show" do
    subject { post "/games/create-or-show", params: params }

    let(:uuid) { SecureRandom.uuid }
    let(:choice) { 'rock' }

    let(:params) do
      {
        uuid: uuid,
        game: {
          user_choice: choice,
          computer_choice: choice
        }
      }
    end

    context 'when the game is new' do
      it 'returns a 201 status code' do
        expect { subject }.to change { Game.count }.by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to match({ 'result' => 'Tie!' })
      end
    end

    context 'when the game already exists' do
      before { Game.create(uuid: uuid, user_choice: choice, computer_choice: choice ) }
      after { Game.find_by(uuid: uuid).destroy }

      it 'returns a 200 status code' do
        expect { subject }.to change { Game.count }.by(0)

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to match({ 'result' => 'Tie!' })
      end
    end
  end
end
