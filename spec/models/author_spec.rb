require "rails_helper"

RSpec.describe Author, type: :model do
  describe 'validations' do
    it 'is valid when valid attributes' do
      author = build(:author)

      expect(author).to be_valid
    end

    it 'is invalid without name' do
      author = build(:author, name: nil)

      expect(author).to be_invalid
    end

    it 'is invalid without last name' do
      author = build(:author, last_name: nil)

      expect(author).to be_invalid
    end

    it 'is invalid without birthdate' do
      author = build(:author, birth_date: nil)

      expect(author).to be_invalid
    end
  end
end