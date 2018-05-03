class ImagesController < ApplicationController

  def create
    @images = params[:user][:images]

    @images.each do |pic|
      image = Image.new()
      image.user_id = current_user.id
      image.picture = pic
      image.save
      if !image.save
        render 'edit'
        flash[:notice] = "wrong file type"
      end
    end
    redirect_to root_path(current_user)
  end



end
