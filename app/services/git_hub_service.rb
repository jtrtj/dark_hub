class GitHubService
  def self.user(token)
    conn(token).get("/user")
  end

  def self.user_repos(token, user_name)
    conn(token).get("users/#{user_name}/repos")
  end

  def self.conn(token)
    Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.headers["Authorization"] = "token #{token}"
      faraday.adapter Faraday.default_adapter
    end
  end
end