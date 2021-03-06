class ReposController < ApplicationController
  def index
    @team_name = github_api.orgs.teams.get(params[:team_id])[:name]
    @repos = github_api.orgs.teams.repos(params[:team_id])
                       .select { |repo| repo[:fork] == false }
                       .sort_by { |repo| repo[:full_name].downcase }
  end
end
