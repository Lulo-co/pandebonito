require 'rails_helper'

describe "Deleting recipes" do
  let!(:new_recipe) {
    new_recipe = Recipe.create title:"My Title",
                               preparation: "Steps"
  }

  it "delete succesfully" do
    visit "/recipes"
    within "#recipe_#{new_recipe.id}" do
      click_link "Destroy"
    end

    expect(page).to_not have_content(new_recipe.title)
    expect(Recipe.count).to eq(0)
  end

end