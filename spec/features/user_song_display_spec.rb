require 'rails_helper'

describe 'user song view' do
  let(:tino) { User.create(username: 'tino', password: 'chino') }

  it 'should display only users songs' do
    song = tino.songs.create(artist: 'the bobs', title: 'bob song')
    song_2 = Song.create(artist: 'exorcist', title: 'the nonexistent')
    visit login_path
    fill_in('session_username', with: 'tino')
    fill_in('session_password', with: 'chino')
    click_link_or_button 'Log in'
    expect(page).to have_content(song.title)
    expect(page).not_to have_content(song_2.title)
  end
end
