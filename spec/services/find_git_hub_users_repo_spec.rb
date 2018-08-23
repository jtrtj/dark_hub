require 'rails_helper'

describe FindGitHubUserRepos do
  context '.find' do
    it 'can return a collection of git_hub_repo objects from the git_hub service', :vcr do
      token = ENV['jtrtj_test_token']
      user_id = 'jtrtj'

      repos = FindGitHubUserRepos.find(token, user_id)
      repo = repos.first

      expect(repos.class).to be(Array)
      expect(repo.name.class).to be(String)
      expect(repo.description.class).to be(String).or be(NilClass) #if no desc. JSON parse makes a nil object
      expect(repo.html_url.class).to be(String)
      expect(repo.api_url.class).to be(String)
    end
  end
end
