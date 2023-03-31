class ChatbotController < ApplicationController
  def index
  input = params[:transcript]

  # pass input into node app
  response = `node app/javascripts/chatbot.js "#{input}"`

  # Render response
  render json: response
  end
end
