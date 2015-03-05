require 'rails_helper'

describe 'login function' do
  it 'should login a user with valid credentials' do
    User.create(username: 'tino', password: 'chino')
    visit login_path
    expect(page).to have_button('Log in')
    expect(page).not_to have_content('Log out')
    fill_in('session_username', with: 'tino')
    fill_in('session_password', with: 'chino')
    click_link_or_button 'Log in'
    expect(page).to have_content('tino signed in successfully.')
    expect(page).to have_content('Hello tino.')
    expect(page).to have_content('Log out')
  end

  it 'should flash negative notice with bad login' do
    User.create(username: 'tino', password: 'chino')
    visit login_path
    fill_in('session_username', with: 'tino')
    fill_in('session_password', with: 'not_tino')
    click_link_or_button 'Log in'
    expect(page).to have_content('You are wrong.')
  end

  it 'should logout a user' do
    User.create(username: 'tino', password: 'chino')
    visit login_path
    fill_in('session_username', with: 'tino')
    fill_in('session_password', with: 'chino')
    click_link_or_button 'Log in'
    click_link_or_button 'Log out'
    expect(page).to have_content('tino signed out successfully.')
    expect(page).to have_content('Please log in')
  end
end
