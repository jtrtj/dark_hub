class DashboardController < ApplicationController
  before_action :ensure_logged_in, only: :show

  def show
    conn = Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/user")

    @profile = GitHubProfile.new(JSON.parse(response.body, symbolize_names: true))
    require 'pry'; binding.pry
  end
end
