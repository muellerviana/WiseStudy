require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "validations" do
    it "is valid with valid attributes" do
      article = build(:article)

      expect(article).to be_valid
    end

    it "is invalid without title" do
      article = build(:article, title: nil)

      expect(article).to be_invalid
    end

    it "is invalid without description" do
      article = build(:article, description: nil)

      expect(article).to be_invalid
    end

    it "is invalid without body" do
      article = build(:article, body: nil)

      expect(article).to be_invalid
    end
  end
end
