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

end
