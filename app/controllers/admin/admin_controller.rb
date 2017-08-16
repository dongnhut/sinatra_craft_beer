module Admin
  class AdminController < ApplicationController
    after do
      unless is_login?
        redirect '/admin/auth/login'
      end
    end

    get '/' do
      count_categories = Category.count(:id)
      count_beers = Beer.count(:id)

      erb :'dashboard',
          :locals => { :count_categories => count_categories, :count_beers => count_beers },
          :layout => :admin_layout
    end
  end
end
