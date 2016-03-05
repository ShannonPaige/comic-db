require 'rails_helper'

RSpec.describe "characters/index", type: :view do
  before(:each) do
    assign(:characters, [
      Character.create!(
        :character_id => 1,
        :name => "Name",
        :aliases => "Aliases",
        :deck => "Deck",
        :publisher => "Publisher",
        :img => "Img"
      ),
      Character.create!(
        :character_id => 1,
        :name => "Name",
        :aliases => "Aliases",
        :deck => "Deck",
        :publisher => "Publisher",
        :img => "Img"
      )
    ])
  end

  it "renders a list of characters" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Aliases".to_s, :count => 2
    assert_select "tr>td", :text => "Deck".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
