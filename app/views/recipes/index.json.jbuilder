json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :preparation
  json.url recipe_url(recipe, format: :json)
end
