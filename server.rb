module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      @user = User.find(session[:user_id]) if session[:id]
      binding.pry
      erb :index     
    end

    post "/sessions" do
      user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
      if user 
        session[:user_id] = user.id
        redirect to "/"
      else
        redirect to "/"
      end
    end

    delete "/sessions" do
      session[:user_id] = nil
      redirect to "/" 
    end

    get "/users/new" do
      erb :new_user
    end

    post "/users" do
      @user = User.create(username: params[:username], location: params[:location], avatar_img_url: params[:avatar_img_url], password: params[:password], password_confirmation: params[:password_confirmation])
      redirect to "/"
    end

    get "/users" do
      reidrect to "/" if !session[:user_id]
      @users = User.all
      erb :users
    end

    get "/articles" do
      redirect to "/" if !session[:user_id]
      @articles = Articles.all
      erb :articles
    end

  end
end