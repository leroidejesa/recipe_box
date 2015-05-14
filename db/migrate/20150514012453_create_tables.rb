class CreateTables < ActiveRecord::Migration
  def change

    create_table(:categories) do |t|
      t.column(:description, :string)
    end

    create_table(:recipes) do |t|
      t.column(:description, :string)
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)
    end

    create_table(:ingredients) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :integer)
    end
#no join table necessary for ingredients and recipes -- won't be many-to-many, ingredients will be unique.
    create_table(:instructions) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :integer)
    end

  end
end
