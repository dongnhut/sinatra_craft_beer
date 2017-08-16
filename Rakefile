require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

require 'require_all'
require_all './app/model'
# require_all './lib/tasks'
Dir.glob('lib/tasks/*.rake').each { |r| load r}
