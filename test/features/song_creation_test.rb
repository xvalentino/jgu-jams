require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can view the page" do
    visit new_song_path
    assert page.has_content?("create a new song")
  end

  test "user can submit a song" do
    visit new_song_path
    fill_in 'Jeffrey', with: 'Wake up'
    fill_in 'Artist', with: 'AWOLNation'
    click_button 'Create Song'
    assert page.has_content?("AWOLNation")
  end

  test "user does not see unsubmitted song" do
    visit new_song_path
    fill_in 'Jeffrey', with: 'Wake up'
    fill_in 'Artist', with: 'AWOLNation'
    click_button 'Create Song'
    refute page.has_content?("Beach house")
  end
end
