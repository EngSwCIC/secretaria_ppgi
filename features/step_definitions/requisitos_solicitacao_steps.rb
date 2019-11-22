Dado /estou.*página inicial/i do
    visit 'localhost:3000'
end
  
Quando /clico.*"(.*)"/ do
    find($1).click
end