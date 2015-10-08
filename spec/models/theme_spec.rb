require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe ".highest_vote" do
    it "returns the submission with the highest vote_count" do
      mermaid = FactoryGirl.create(:theme)
      bubbles = FactoryGirl.create(:theme, title:'Bubbles', vote_count: 12)
      expect(Theme.highest_vote).to eq(mermaid)
    end
  end
end
