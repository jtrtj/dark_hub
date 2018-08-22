class DashboardController < ApplicationController
  before_action :ensure_logged_in, only: :show

  def show
    @git_hub_user = FindGitHubUser.find(current_user.token)
    @git_hub_user_repos = FindGitHubUserRepos.find(current_user.token, current_user.user_name)
    # @GitHubUser = GitHubUser.new(JSON.parse(GitHubService.user(current_user.token).body, symbolize_names: true))
    # conn = GitHubService.conn(current_user.token)

    # # conn = Faraday.new(:url => "https://api.github.com/") do |faraday|
    # #   faraday.headers["Authorization"] = "token #{current_user.token}"
    # #   faraday.adapter Faraday.default_adapter
    # # end

    # response = conn.get("/user")
  end
end
