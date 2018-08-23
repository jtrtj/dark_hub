class FindGitHubUserRepos
  def self.find(token, user_name)
    make_repos(GitHubService.user_repos(token, user_name))
  end

  private

  def self.make_repos(user_repos_data)
    user_repos_data.map do |repo_data|
      GitHubUserRepo.new(repo_data)
    end
  end
end