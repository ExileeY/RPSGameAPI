require 'net/http'

class ComputerChoiceGenerator
  CURB_URI = URI("https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw")

  def self.call
    response = Net::HTTP.get_response(CURB_URI)
    parsed_response = JSON.parse(response.body)

    if parsed_response['statusCode'] == 200
      parsed_response['body']
    else
      Game::CHOICES.sample
    end
  end
end
