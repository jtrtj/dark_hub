require 'rails_helper'

describe FindGitHubUsersCommits do
  context '.find' do
    it 'can return a collection of git_hub_commit objects from the git_hub service', :vcr do
      token = ENV['jtrtj_test_token']
      user_id = 'jtrtj'

      commits = FindGitHubUsersCommits.find(token, user_id)
      commit = commits.first

      expect(commits.class).to be(Array)
      expect(commit.class).to be(GitHubUserCommit)
    end
  end
end