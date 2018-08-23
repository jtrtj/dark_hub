class GitHubService
  def self.user(token)
    result = conn(token).get("/user")
    parse_result_body(result)
  end

  def self.user_repos(token, user_name)
    result = conn(token).get("users/#{user_name}/repos")
    parse_result_body(result)
  end

  private

  def self.conn(token)
    Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.headers["Authorization"] = "token #{token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_result_body(raw_json)
    JSON.parse(raw_json.body, symbolize_names: true)
  end
end