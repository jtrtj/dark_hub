class GithubUser < SimpleDelegator

  def avatar_url
    profile.avatar_url
  end

  def followers
    profile.followers
  end

  def following
    profile.following
  end

  def profile
    @profile ||= FindGitHubUser.find(token)
  end
  
  def repos
    @repos ||= FindGitHubUserRepos.find(token, user_name)
  end
end