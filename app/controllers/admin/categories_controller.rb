module Admin
  class CategoriesController < ApplicationController
    DEFAULT_PER_PAGE = 25
    FIRST_PAGE = 1
    before do
      category_params
    end

    get '/' do
      # require 'pry'
      # binding.pry
      categories = Category.offset(params['page']).limit(params['per'])
      meta = {
        page: params['page'],
        per: params['per'],
        total_page: total_page(Category.count(:id), params['per'].to_i)
      }
      erb :'categories/index',
          :locals => { :categories => categories ,
                        :username => "Some one",
                        :meta => meta },
          :layout => :admin_layout
    end

    get '/new' do
      erb :'categories/new', :layout => :admin_layout
    end

    post  '/create' do
      # save database
      begin
        category = Category.new(name: params['name'].to_s)
        category.save!
        # successfully
        '<h1> created </h1>'
      rescue
        'errors'
        # errors
      end
    end

    private

    def total_page total_record = 1, per_page = 1
      total_page = total_record / per_page
      total_page.next unless (total_record % per_page).zero?
    end

    def category_params
      params['page'] ||=  FIRST_PAGE
      params['per'] ||=  DEFAULT_PER_PAGE
    end

  end
end
