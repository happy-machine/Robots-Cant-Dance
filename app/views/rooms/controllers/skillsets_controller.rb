class SkillsetsController < ApplicationController

  def create
    SkillsetManager.new(params[:user][:cuisine_ids], current_user).run
    redirect_to user_path(current_user)
  end

end