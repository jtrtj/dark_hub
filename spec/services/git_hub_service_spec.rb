require 'rails_helper'

describe GitHubService do
  context '.user' do
    it 'can make a GitHub api /user request' do
      token = ENV['jtrtj_test_token']
      
    end
  end
  context '.user_repos' do
    it 'can make a GitHub api /users/:username/repos request' do
      token = ENV['jtrtj_test_token']
      user_name = 'jtrtj'

    end
  end
end