class Slack::Responder

  def initialize(message)
    @message = message
  end

  def respond?
    response.present?
  end

  def response
    @response = Post.best.first.body
  end

  private attr_reader
  :message

end
