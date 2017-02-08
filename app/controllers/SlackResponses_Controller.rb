class SlackresponsesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :verify_slack_token
  def create
    render nothing: true, status: :ok and return unless responder.respond?
    # Respond differently to Slash Command vs Webhook POSTs # See `Responding` sections above for the require difference.

    render json: {response_type: "in_channel", text: responder.response.to_s, "unfurl_media": true }
  end

  private

  def responder
    @responder ||= Slack::Responder.new(params[:text])
  end

  def verify_slack_token
    render nothing: true, status: :forbidden and return unless Slack::TOKEN.include?(params[:token])
  end
end

# TODO seperation of church and state
class Slack::Responder
  def initialize(message)
    @message = message
  end

  def respond?
    response.present?
  end

  def response
    search_result = Post.search({search: message}).first
    video_response = search_result.body
    html = "<iframe width='350' height='200' src='https://youtu.be/W0jVkPYQjEo' frameborder='1' allowfullscreen></iframe>"

    @response ||= video_response
  end

  private

  attr_reader :message

end
