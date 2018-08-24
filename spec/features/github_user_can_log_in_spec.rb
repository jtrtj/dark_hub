require 'rails_helper'

describe 'a user visiting root' do
  scenario 'can log in using github credentials', :vcr do
    stub_omniauth

    visit root_path

    expect(page).to have_link('Login with GitHub')
    
    click_link('Login with GitHub')

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Log Out')
  end
end