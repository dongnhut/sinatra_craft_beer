module Admin
  class CategoriesController < ApplicationController
    DEFAULT_PER_PAGE = 5
    FIRST_PAGE = 1

    before do
      category_params
    end

    get '/' do
      # require 'pry'
      # binding.pry
      # Get total record / limit record => total page
      total = total_page(Category.count(:id), params['per'].to_i)

      # check page current <1 or > total page
      if params['page'].to_i < 1
        params['page'] = FIRST_PAGE
      elsif params['page'].to_i > total
        params['page'] = total
      end

      categories = Category.limit(params['per']).offset((params['page'].to_i - 1) * params['per'].to_i)
      meta = {
        page: params['page'].to_i,
        per: params['per'].to_i,
        total_page: total
      }
      erb :'categories/index',
          :locals => { :categories => categories, :meta => meta },
          :layout => :admin_layout
    end

    post '/' do
      # require 'pry'
      # binding.pry
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
      total_page = (total_record / per_page).ceil

      total_page
      # total_page.next unless (total_record % per_page).zero?
    end

    def category_params
      params['page'] ||= FIRST_PAGE
      params['per'] ||= DEFAULT_PER_PAGE
    end
  end
end
