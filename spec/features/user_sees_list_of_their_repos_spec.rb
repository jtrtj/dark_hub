require 'rails_helper'

feature 'registered user visits their dashboard' do
  scenario 'they see their profile pic, number of starred repos, followers and following' do
    user = User.create!(
                        provider: 'github',
                        uid: ENV['JTRTJ_TEST_UID'],
                        name: 'John Roemer',
                        token: ENV['JTRTJ_TEST_TOKEN']
                      )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   
    visit '/dashboard'
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content(user.name)
    expect(page).to have_css('.avatar')
    expect(page).to have_content('# Starred Repos')
    expect(page).to have_content('3 followers')
    expect(page).to have_content('6 following')
  end
end

#View basic information about my account (profile pic, number of starred repos, followers, following)