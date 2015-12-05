module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id]
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
      @user = User.create(
        username: params[:username], 
        location: params[:location], 
        avatar_img_url: params[:avatar_img_url], 
        password: params[:password], 
        password_confirmation: params[:password_confirmation]
        )
      redirect to "/"
    end

    get "/users" do
      redirect to "/" if !session[:user_id]
      @users = User.all
      erb :users
    end

    get "/users/:id" do
      redirect to "/" if !session[:user_id]
      @user = User.find(params[:id])
      erb :user
    end

    get "/articles/new" do
      erb :new_article
    end

    post "/articles" do
      @article = Article.create(
        title: params[:title], 
        ingredients: params[:ingredients], 
        directions: params[:directions], 
        img_url: params[:img_url],
        created_at: DateTime.now,
        author_id: session[:id]
        )
      redirect to "/article/#{params[:id]}"
    end

    get "/articles" do
      redirect to "/" if !session[:user_id]
      @articles = Article.all
      erb :articles
    end

    get "/articles/:id" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      erb :article
    end

  end
end