require 'rails_helper'

feature 'registered user visits their dashboard' do
  scenario 'they see their profile pic, number of starred repos, followers and following', :vcr do
    user = User.create!(
                        provider: 'github',
                        uid: ENV['jtrtj_test_uid'],
                        name: 'John Roemer',
                        token: ENV['jtrtj_test_token'],
                        user_name: 'jtrtj'
                      )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   
    visit '/dashboard'
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content(user.name)
    expect(page).to have_css('.avatar')
    # expect(page).to have_content('# Starred Repos')
    expect(page).to have_content('5 followers')
    expect(page).to have_content('6 following')
  end

  scenario 'they see a list of all their repos', :vcr do
    user = User.create!(
                        provider: 'github',
                        uid: ENV['jtrtj_test_uid'],
                        name: 'John Roemer',
                        token: ENV['jtrtj_test_token'],
                        user_name: 'jtrtj'
                      )
 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'
    
    expect(page).to have_css('.repos')
    # expect(page).to have_css('.repo_description')
    # expect(page).to have_css('.repo_link')
  end

  scenario 'they see a list of their commits', :vcr do
    user = User.create!(
                        provider: 'github',
                        uid: ENV['jtrtj_test_uid'],
                        name: 'John Roemer',
                        token: ENV['jtrtj_test_token'],
                        user_name: 'jtrtj'
                      )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_css('.commits')
  end
end