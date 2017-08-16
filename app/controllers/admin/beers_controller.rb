module Admin
  class BeersController < AdminController #change extend from AdminController
    get '/' do
      total = total_page(Beer.count(:id), params['per'].to_f)

      if params['page'].to_i < 1
        params['page'] = FIRST_PAGE
      elsif params['page'].to_i > total
        params['page'] = total
      end

      beers = Beer.limit(params['per']).offset((params['page'].to_i - 1) * params['per'].to_i).order('id DESC')

      meta = {
        per: params['per'].to_i,
        page: params['page'].to_i,
        total_page: total
      }

      erb :'beers/index',
          :locals => { :beers => beers, :meta => meta },
          :layout => :admin_layout
    end

    get '/create' do
      categories = Category.all

      erb :'beers/create',
          :locals => { :categories => categories },
          :layout => :admin_layout
    end

    post '/create' do
      data = {
        name: params['name'],
        category_id: params['category_id'],
        manufacturer: params['manufacturer'],
        country: params['country'],
        price: params['price'],
        description: params['description'],
      }
      begin
        beer = Beer.new(data)
        beer.save!
        redirect '/admin/beers'
      rescue
        'errors'
      end
    end

    get '/:id/edit' do
      categories = Category.all
      beer = Beer.find(params['id'])

      erb :'beers/edit',
          :locals => { :categories => categories, :beer => beer },
          :layout => :admin_layout
    end

    put '/:id/edit' do
      beer = Beer.find(params['id'])
      data = {
        name: params['name'],
        category_id: params['category_id'],
        manufacturer: params['manufacturer'],
        country: params['country'],
        price: params['price'],
        description: params['description'],
        show: params['show'].to_i ||= 0
      }
      begin
        beer.update(data)
        redirect '/admin/beers'
      rescue Exception => e
        e.message
      end
    end

    delete '/:id/delete' do
      "Delete id #{ params['id'] }"
    end

  end
end
