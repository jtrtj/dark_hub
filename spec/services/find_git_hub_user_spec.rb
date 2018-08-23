require 'rails_helper'

describe FindGitHubUser do
  context '.find' do
    it 'can return a git_hub_user object from the git_hub service', :vcr do
      token = ENV['jtrtj_test_token']

      git_hub_user = FindGitHubUser.find(token)

      expect(git_hub_user.class).to be(GitHubUser)  
      expect(git_hub_user.name.class).to be(String)  
      expect(git_hub_user.avatar_url).to_not be_nil
    end
  end
end
