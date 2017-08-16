class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  set :views, Proc.new { File.expand_path('../../views/admin', File.dirname(__FILE__))}
  set :method_override, true
  enable :sessions

  DEFAULT_PER_PAGE = 10
  FIRST_PAGE = 1

  before do
    paginate_param

    if is_login?
      @username = session[:current_user].name
    end
  end

  protected

  def total_page total_record = 1, per_page = 1
    total_page = (total_record / per_page).ceil

    total_page
  end

  def paginate_param
    params['per'] ||= DEFAULT_PER_PAGE
    params['page'] ||= FIRST_PAGE
  end

  def is_login?
    if session[:current_user]
      true
    else
      false
    end
  end
end
