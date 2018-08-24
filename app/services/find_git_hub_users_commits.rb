class FindGitHubUsersCommits
  def self.find(token, user_name)
    make_commits(GitHubService.user_commits(token, user_name))
  end

  private

  def self.make_commits(user_commits_data)
    user_commits_data.map do |commit_data|
      GitHubUserCommit.new(commit_data)
    end
  end
end