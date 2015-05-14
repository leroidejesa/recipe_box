require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

get('/categories/new') do
  erb(:category_form)
end

post('/categories') do
  name = params.fetch('name')
  @new_category = Category.new({:description => name})
  if @new_category.save()
    redirect to("/categories/#{@new_category.id}")
  else
    @recipes = Recipe.all()
    @categories = Category.all()
    erb(:index)
  end
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i())
  # category_id = params.fetch("id").to_i()
  @recipes = @category.recipes()
  @categories = Category.all()
  erb(:category)
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
  @ingredients = @recipe.ingredients()
  @instructions = @recipe.instructions()
  @categories = Category.all()
  @recipe_categories = @recipe.categories()
  erb(:recipe)
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @ingredients = @recipe.ingredients()
  @instructions = @recipe.instructions()
  @categories = Category.all()
  @recipe_categories = @recipe.categories()
  erb(:recipe_edit)
end

get('/recipes/:id/edit/category') do
  recipe_id = params.fetch("id").to_i()
  @recipe = Recipe.find(recipe_id)
  @categories = Category.all()
  erb(:category_update)
end

post('/ingredients') do
  ingredient = params.fetch("ingredient")
  recipe_id = params.fetch("recipe_id").to_i()
  @recipe = Recipe.find(recipe_id)
  @new_ingredient = Ingredient.new({:description => ingredient, :recipe_id => recipe_id})
  if @new_ingredient.save()
    redirect to("/recipes/#{recipe_id}/edit")
  else
    @recipes = Recipe.all()
    @categories = Category.all()
    erb(:index)
  end
end

post('/instructions') do
  instruction = params.fetch("instruction")
  recipe_id = params.fetch("recipe_id").to_i()
  @recipe = Recipe.find(recipe_id)
  @new_instruction = Instruction.new({:description => instruction, :recipe_id => recipe_id})
  if @new_instruction.save()
    redirect to("/recipes/#{recipe_id}/edit")
  else
    @recipes = Recipe.all()
    @categories = Category.all()
    erb(:index)
  end
end

#category dropdown
patch("/recipe/categories/:id") do
  recipe_id = params.fetch("id").to_i()
  @recipe = Recipe.find(recipe_id)
  category_ids = params.fetch("category_ids")
  @recipe.update({:category_ids => category_ids})
  @categories = Category.all()
  redirect to("/recipes/#{recipe_id}/edit")
  # recipe_id = params.fetch("id").to_i()
  # @recipe = Recipe.find(recipe_id)
  # category = params.fetch("myform")
  # category_id = Category.find(category.id().to_i())
  # @recipe.update({:category_id => category_id})
  # redirect to("/recipes/#{recipe_id}")
end
