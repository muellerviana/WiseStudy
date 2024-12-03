require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'is valid when valid attributes' do
      book = build(:book)

      expect(book).to be_valid
    end

    it 'is invalid without no title' do
      book = build(:book, title: nil)

      expect(book).to be_invalid
    end
  end

  describe 'associations' do
    it 'has many books' do
      book = create(:book)
      expect(book.authors.count).to eq(2)
    end
  end
end