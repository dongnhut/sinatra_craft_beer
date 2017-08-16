module Admin
  class CategoriesController < AdminController
    get '/' do
      # require 'pry'
      # binding.pry
      # Get total record / limit record => total page
      total = total_page(Category.count(:id), params['per'].to_f)

      # check page current <1 or > total page
      if params['page'].to_i < 1
        params['page'] = FIRST_PAGE
      elsif params['page'].to_i > total
        params['page'] = total
      end

      categories = Category.limit(params['per']).offset((params['page'].to_i - 1) * params['per'].to_i).order('id DESC')
      meta = {
        page: params['page'].to_i,
        per: params['per'].to_i,
        total_page: total
      }
      erb :'categories/index',
          :locals => { :categories => categories, :meta => meta },
          :layout => :admin_layout
    end

    get '/create' do
      erb :'categories/create',
          :layout => :admin_layout
    end

    post '/create' do
      # require 'pry'
      # binding.pry
      begin
        category = Category.new({
          name: "#{ params['name'] }",
          description: "#{ params['description'] }"
        })
        category.save!
        redirect '/admin/categories'
      rescue
        'errors'
        # errors
      end
    end

    get '/:id/edit' do
      category = Category.find(params['id'])

      erb :'categories/edit',
          :locals => { :category => category },
          :layout => :admin_layout
    end

    put '/:id/edit' do
      beer = Category.find(params['id'])
      data = {
        name: params['name'],
        description: params['description'],
      }
      begin
        beer.update(data)
        redirect '/admin/categories'
      rescue Exception => e
        e.message
      end
    end

    delete '/:id/delete' do
      begin
        category = Category.find(params['id'])
        category.destroy!
        redirect '/admin/categories'
      rescue Exception => e
        e.message
      end
    end
  end
end
