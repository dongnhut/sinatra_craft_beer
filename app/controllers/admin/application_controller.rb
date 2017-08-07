class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.expand_path('../../views/admin', File.dirname(__FILE__))}
end
