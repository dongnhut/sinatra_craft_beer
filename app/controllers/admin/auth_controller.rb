module Admin
  class AuthController < ApplicationController
    after do
      if is_login?
        redirect '/admin'
      end
    end

    get '/login' do
      erb :'auth/login'
    end

    post '/login' do
      username = params['username']
      password = params['password']

      if username.blank? || password.blank?
        flash[:msg] = 'Login Fail! Please try again.'
        redirect back
      end

      admin = Admini.find_by(username: username)

      if admin.nil?
        flash[:msg] = 'User not exist! Please try again.'
        redirect back
      else
        if test_password(password, admin.password)
          session.clear
          session[:current_user] = admin
          redirect '/admin'
        else
          session.clear
          flash[:msg] = 'Login Fail! Please try again.'
          redirect back
        end
      end
    end

    get '/logout' do
      session.clear
      redirect '/admin/login'
    end

    private

    def test_password(password, hash)
      if BCrypt::Password.new(hash) == password
        true
      else
        false
      end
    end
  end
end
