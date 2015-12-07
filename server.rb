module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @user_articles = Article.where(author_id: session[:user_id])
      @new_article_one = Article.all.order(:created_on).reverse_order.first
      @new_article_two = Article.all.order(:created_on).reverse_order.second
      @new_article_three = Article.all.order(:created_on).reverse_order.third
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
      @user_articles = Article.where(author_id: params[:id])
      erb :user
    end

    get "/articles/new" do
      redirect to "/" if !session[:user_id]
      erb :new_article
    end

    post "/articles" do
      @article = Article.create(
        title: params[:title], 
        ingredients: params[:ingredients], 
        # code below adapted from http://aspiringwebdev.com/markdown-in-rails-with-redcarpet/
        directions: params[:directions],
        img_url: params[:img_url],
        created_on: DateTime.now,
        author_id: session[:user_id]
        )
      redirect to "/articles"
    end

    get "/articles" do
      redirect to "/" if !session[:user_id]
      @articles = Article.all
      erb :articles
    end

    get "/articles/:id" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      # code below from http://stackoverflow.com/questions/9780169/active-record-model-find-last
      @edit = Edit.where(article_id: params[:id]).order(:edited_at).last
      @categories = @article.categories
      erb :article
    end

    get "/articles/:id/edit" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      erb :edit_article
    end

    patch "/articles/:id" do
      article = Article.find(params[:id])
      article.update(
        title: params[:title], 
        ingredients: params[:ingredients],
        directions: params[:directions],
        img_url: params[:img_url]
        )
      Edit.create(
        article_id: params[:id],
        editor_id: session[:user_id],
        edited_at: DateTime.now
        )
      redirect to "/articles/#{article.id}"
    end

    delete "/articles/:id" do 
      article = Article.find(params[:id])
      article.destroy
      redirect to "/articles"
    end

    get "/categories" do
      redirect to "/" if !session[:user_id]
      @categories = Category.all
      erb :categories
    end

    get "/categories/:id" do
     redirect to "/" if !session[:user_id]
     @category = Category.find(params[:id])
     @articles = @category.articles
     erb :category
    end

    get "/articles/:id/categories/new" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      erb :new_category
    end

    post "/articles/:id/categories" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      @category = Category.create(
        name: params[:name]
        )
      @articles_categories = ArticlesCategory.create (
        article_id: params[:id],
        category_id: @category.id,
        )
      redirect to "/articles/#{@article.id}"
    end

  end
end