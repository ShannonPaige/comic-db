require "rails_helper"

describe "the search process" do

  it "user can get to search page" do
    visit '/'
    expect(page).to have_content '6 Degrees How are comic book characters connected? You might be surprised?'
    expect(page).to have_button 'Get Started'

    click_button 'Get Started'

    expect(page).to have_current_path(new_connection_path)
    expect(page).to have_content 'Choose first character:'
    expect(page).to have_content 'Choose second character:'
    expect(page).to have_button 'submit'
  end

  # it "user can run a search on two characters" do
  #   skip
  #   first_character = Character.create(name: "Betty", character_id: 654334)
  #   second_character = Character.create(name: "Veronica", character_id: 2345654)
  #   first_character.friends << second_character
  #
  #   visit new_connection_path
  #   select 'Betty', from: :first_character_character_id
  #   select 'Veronica', from: :second_character_character_id
  #   click_button 'submit'
  #
  #   expect(page).to have_current_path(connections_path)
  #   expect(page).to have_content 'There are 1 degree(s) of seperation.'
  # end

end
