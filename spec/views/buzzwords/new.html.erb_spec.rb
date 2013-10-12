require 'spec_helper'

describe "buzzwords/new" do
  before(:each) do
    assign(:buzzword, stub_model(Buzzword,
      :word => "MyString",
      :votes => 1
    ).as_new_record)
  end

  it "renders new buzzword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", buzzwords_path, "post" do
      assert_select "input#buzzword_word[name=?]", "buzzword[word]"
      assert_select "input#buzzword_votes[name=?]", "buzzword[votes]"
    end
  end
end
