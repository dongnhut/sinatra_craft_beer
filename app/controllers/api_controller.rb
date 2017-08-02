class ApiController < Sinatra::Base
  # call back, dung cac ham xu ly chung
  before do
    response_header
  end

  private

  def response_header
    headers 'Content-Type' => 'application/json'
  end
end
