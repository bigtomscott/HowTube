class SlackResponsesController < ApplicationController

  def create
    render nothing: true, status: :ok and return unless responder.respond?

    if params[:command].present?
      render text: responder.response.to_s
    end

  end

  private

  def responder
    @responder = Slack::Responder.new(params[:text])
  end

end
