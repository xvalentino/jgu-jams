require 'rails_helper'

RSpec.describe 'can create a song' do
  context 'with valid attributes' do
    it 'saves and displays a song title' do
      visit new_song_path
      fill_in 'Jeffrey', with: 'Wake up'
      fill_in 'Artist', with: 'AWOLNation'
      click_button 'Create Song'
      expect(page).to have_content('AWOLNation')
    end
  end
end
