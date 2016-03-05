require 'rails_helper'

RSpec.describe "characters/show", type: :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      :character_id => 1,
      :name => "Name",
      :aliases => "Aliases",
      :deck => "Deck",
      :publisher => "Publisher",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Aliases/)
    expect(rendered).to match(/Deck/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Img/)
  end
end
