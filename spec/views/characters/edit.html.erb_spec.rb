require 'rails_helper'

RSpec.describe "characters/edit", type: :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      :character_id => 1,
      :name => "MyString",
      :aliases => "MyString",
      :deck => "MyString",
      :publisher => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit character form" do
    render

    assert_select "form[action=?][method=?]", character_path(@character), "post" do

      assert_select "input#character_character_id[name=?]", "character[character_id]"

      assert_select "input#character_name[name=?]", "character[name]"

      assert_select "input#character_aliases[name=?]", "character[aliases]"

      assert_select "input#character_deck[name=?]", "character[deck]"

      assert_select "input#character_publisher[name=?]", "character[publisher]"

      assert_select "input#character_img[name=?]", "character[img]"
    end
  end
end
