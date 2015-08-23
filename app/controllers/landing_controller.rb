class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    github = Github.new(
      client_id: ENV['GITHUB_APP_ID'],
      client_secret:ENV['GITHUB_APP_SECRET']
    )
    binding.pry
  end

  def create_hook(github)
    github.repos.hooks.create 'flemse', 'dotfiles',
      name:  "web",
      active: true,
      config: {
        url: "http://test.test"
      }
  end
end
