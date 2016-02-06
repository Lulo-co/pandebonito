require 'rails_helper'

describe "Editing recipes" do
  let!(:new_recipe) {
    new_recipe = Recipe.create title:"Title",
                               preparation: "Steps"
  }

  def update_recipe(options={})
    options[:title] ||= "Default title"
    options[:preparation] ||= "Default preparation"

    new_recipe = options[:recipe]

    visit "/recipes"
    within "#recipe_#{new_recipe.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Preparation", with: options[:preparation]
    click_button "Update Recipe"
  end

  it "update succesfully" do
    update_recipe title: "New Title",
                  preparation: "New Steps",
                  recipe: new_recipe
    new_recipe.reload
    expect(page).to have_content("Recipe was successfully updated")
    expect(new_recipe.title).to eq("New Title")
    expect(new_recipe.preparation).to eq("New Steps")
  end

  it "displays error with no title" do
    update_recipe recipe: new_recipe, title: ""
    expect(page).to have_content("error")
  end

  it "displays error with no preparation" do
    update_recipe recipe: new_recipe, preparation: ""
    expect(page).to have_content("error")
  end

end