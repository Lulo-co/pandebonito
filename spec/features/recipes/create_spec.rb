require 'rails_helper'

describe "Creating recipes" do

  it "redirects to the recipes index page on success" do
    visit "/recipes"
    click_link "New Recipe"
    expect(page).to have_content("New Recipe")

    fill_in "Title", with: "First recipe"
    fill_in "Preparation", with: "Some steps ..."

    click_button "Create Recipe"
    expect(page).to have_content("Recipe was successfully created.")
    expect(Recipe.count).to eq(1)
  end

  it "Displays an error when title is empty" do
    visit "/recipes/new"
    fill_in "Preparation", with: "Some steps ..."
    click_button "Create Recipe"
    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("Some steps ...")
  end


  it "Displays an error when preparation is empty" do
    visit "/recipes/new"
    fill_in "Title", with: "Some"
    click_button "Create Recipe"
    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("Some")
  end
end