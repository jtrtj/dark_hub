class FindGitHubUser
  def self.find(token)
    GitHubUser.new(JSON.parse(GitHubService.user(token).body, symbolize_names: true))
  end
end