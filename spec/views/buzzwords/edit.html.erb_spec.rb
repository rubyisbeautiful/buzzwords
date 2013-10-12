require 'spec_helper'

describe "buzzwords/edit" do
  before(:each) do
    @buzzword = assign(:buzzword, stub_model(Buzzword,
      :word => "MyString",
      :votes => 1
    ))
  end

  it "renders the edit buzzword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", buzzword_path(@buzzword), "post" do
      assert_select "input#buzzword_word[name=?]", "buzzword[word]"
      assert_select "input#buzzword_votes[name=?]", "buzzword[votes]"
    end
  end
end
