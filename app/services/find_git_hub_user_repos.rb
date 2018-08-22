class FindGitHubUserRepos
  def self.find(token, user_name)
    results = GitHubService.user_repos(token, user_name)
    make_repos(JSON.parse(results.body, symbolize_names: true))
  end

  private

  def self.make_repos(user_repos_data)
    user_repos_data.map do |repo_data|
      GitHubUserRepo.new(repo_data)
    end
  end
end