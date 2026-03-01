require 'rails_helper'

feature 'Visit homepage' do
  context 'when search for article' do
    Article.create(
      title: "Historia da Teologia Reformada",
      description: "Breve resumo",
      body: "lorem ipsum dolor si amet"
    )

    it 'returns articles' do
      visit root_path
      fill_in 'q', with: 'Teologia'
      click_on 'search-btn'    

      expect(current_path).to eq site_search_path
      expect(page).to have_content('Historia da Teologia')
    end

    it 'does not return articles' do
      visit root_path
      fill_in 'q', with: 'Recursividade'
      click_on 'search-btn'

      expect(current_path).to eq site_search_path
      expect(page).to have_content("No results found for 'Recursividade', try something different.")
    end
  end
end