require 'httparty'

class AfricaTalkingService
  include HTTParty
  base_uri 'https://api.africastalking.com/version1'

  def initialize
    @headers = {
      "apiKey" => ENV["AFRICASTALKING_API_KEY"],
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    }
    @username = ENV["AFRICASTALKING_USERNAME"]
  end

  def send_sms(to:, message:)
    self.class.post("/messaging", {
      headers: @headers,
      body: {
        username: @username,
        to: to,
        message: message
      }
    })
  end
end
