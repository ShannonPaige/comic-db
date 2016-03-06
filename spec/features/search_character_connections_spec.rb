require "rails_helper"

describe "the search process" do

  it "user can get to search page" do
    visit '/'
    expect(page).to have_content 'Six Degrees of Superheroes'
    expect(page).to have_button 'Get Started'

    click_button 'Get Started'

    expect(page).to have_current_path(new_connection_path)
    expect(page).to have_content 'Choose first character:'
    expect(page).to have_content 'Choose second character:'
    expect(page).to have_button 'Find distance'
  end

  it "user can run a search on two characters" do
    char1 = Character.create(name: "Betty", character_id: 654334)
    char2 = Character.create(name: "Veronica", character_id: 2345654)
    visit 'new_connection_path'
    select 'Betty', from: :first_character
    select 'Veronica', from: :second_character

    expect(page).to have_current_path(new_connection_path)
    expect(page).to have_content 'The distance is 4'
  end

end
