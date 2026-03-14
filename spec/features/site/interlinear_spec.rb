require 'rails_helper'

RSpec.describe 'Interlinear', type: :feature, js: true do
  context 'when search for book' do
    let!(:book)    { create(:bible_book, name: 'Matthew', testament: 'New Testament') }
    let!(:chapter) { create(:chapter, bible_book: book, number: 1) }

    before do
      create(:verse, :with_words, words_count: 8, chapter: chapter)
      visit site_interlinear_path
    end

    it 'displays book dropdown on index' do
      expect(page).to have_select('bible_book', with_options: ['Matthew'])
    end

    it 'gies to chapters page' do
       click_on 'Search'

      expect(page).to have_text('αρχη')
    end
  end
end