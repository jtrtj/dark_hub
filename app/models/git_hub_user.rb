class GitHubUser
  attr_reader :name, :avatar_url, :followers, :following
  def initialize(attributes_json_data)
    @name = attributes_json_data[:name]
    @avatar_url= attributes_json_data[:avatar_url]
    @followers = attributes_json_data[:followers]
    @following = attributes_json_data[:following]
  end
end