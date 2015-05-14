require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

get('/recipes/new') do
  erb(:recipe_form)
end

post('/recipes') do
  name = params.fetch('name')
  @new_recipe = Recipe.new({:description => name})
  if @new_recipe.save()
    redirect to("/recipes/#{@new_recipe.id}")
  else
    @recipes = Recipe.all()
    @categories = Category.all()
    erb(:index)
  end
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe)
end
