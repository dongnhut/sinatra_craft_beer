class ApiController < Sinatra::Base

  before do
      set_headers
  end

  private

  def set_headers
    headers['Content-Type'] = 'application/json'
  end

end
