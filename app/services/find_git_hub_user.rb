class FindGitHubUser
  def self.find(token)
    GitHubUser.new(github_conn(token))
  end

  private

  def self.github_conn(token)
    GitHubService.user(token)
  end
end