require 'spec_helper'

describe "buzzwords/index" do
  before(:each) do
    assign(:buzzwords, [
      stub_model(Buzzword,
        :word => "Word",
        :votes => 1
      ),
      stub_model(Buzzword,
        :word => "Word",
        :votes => 1
      )
    ])
  end

  xit "renders a list of buzzwords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
