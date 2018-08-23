require 'rails_helper'

describe FindGitHubUser do
  context '.find' do
    it 'can return a git_hub_user object from the git_hub service', :vcr do
      token = ENV['jtrtj_test_token']

      git_hub_user = FindGitHubUser.find(token)

      expect(git_hub_user.class).to be(GitHubUser)  
    end
  end
end
