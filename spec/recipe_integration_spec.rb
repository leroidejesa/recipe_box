require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

# As a user, I want to add a recipe with ingredients and instructions, so I remember how to prepare my favorite dishes.
  # describe('path to add new recipe', {:type => :feature}) do
  #   it('allows a user to add a recipe') do
  #     visit('/')
  #     click_link('ADD A STYLIST')
  #     fill_in('NAME', :with =>'George')
  #     click_button('ADD')
  #     click_link('HOME')
  #     expect(page).to have_content('George')
  #   end
  # end

# As a user, I want to organize my recipes into different categories, so recipes are easier to find. A recipe can have many categories and a category can have many recipes.

# As a user, I want to edit my recipes, so I can make improvements or corrections to my recipes.

# As a user, I want to delete recipes and categories if I find I don't like or use them.

# As a user, I want to rate my recipes, so I know which ones are the best.

# As a user, I want to list my recipes by highest rated so I can see which ones I like the best.

# As a user, I want to see all recipes that use a certain ingredient, so I can more easily find recipes for the ingredients I have.
