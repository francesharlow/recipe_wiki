require_relative "config"

users = [
  {username: "hurdy", 
    password_digest: "gravlax", 
    location: "NYC", 
    avatar_img_url: "/img/swedish_chef.jpg"},
  {username: "ironchef", 
    password_digest: "sushi", 
    location: "Japan", 
    avatar_img_url: "/img/iron_chef.jpg"},
]

User.create(users)

articles = [
  {title: "Hard Boiled Eggs", 
    ingredients: "water, eggs, salt (optional)", 
    directions: "1. Place egg in pot 3/4 full of water. (Salt water if desired.) <br>2. Bring water to a boil, then lower to a simmer and set timer for 10 minutes. <br>3. Remove from heat. Let cool.", 
    img_url: "/img/egg.jpg", 
    created_on: DateTime.new(2015,12,01,8,37), 
    author_id: 1},
  {title: "Homemade Bread", 
    ingredients: "water, flour, yeast, salt (optional)", 
    directions: "1. Combine ingredient in a large bowl, let sit overnight. <br>2. Preheat oven to 400 degrees. Place dough in large, oven-proof pan. <br>3. Bake for 1 hour.", 
    img_url: "/img/bread.jpg", 
    created_on: DateTime.new(2015,12,01,8,50),
    author_id: 2}
]

Article.create(articles)

edits = [
  {article_id: 1, 
    editor_id: 2, 
    edited_at: DateTime.new(2015,12,04,13,50)},
  {article_id: 2, 
    editor_id: 1, 
    edited_at: DateTime.new(2015,12,05,7,26)}
]

Edit.create(edits)

categories = [
  {name: "breakfast"},
  {name: "vegan"}
]

Category.create(categories)

