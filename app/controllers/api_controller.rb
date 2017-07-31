class ApiController < Sinatra::Base

  before do
    response_header
  end

  private

  def response_header
    headers "Content-Type" => "application/json"
  end

end
