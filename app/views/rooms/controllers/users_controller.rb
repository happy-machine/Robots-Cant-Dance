class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params['cuisine'] == ''
       @users = User.all

    elsif params['cuisine']
      @substring = request.params['cuisine']
      @users = User.joins(skillsets: :cuisine).where("cuisines.food LIKE ?", "%#{@substring.capitalize}%")

      if @users.length == 0
        @message = "Could not find chefs with searched cuisine."
      end

    elsif params['commit'] == 'Rating'
      if User.first.switcher == 1
        @users = User.all.order('rating ASC')
        User.first.update_attributes(switcher: 0)
      else
        @users = User.all.order('rating DESC')
        User.first.update_attributes(switcher: 1)
      end

    elsif params['commit'] == 'Caters up to'
      if User.first.switcher == 1
        @users = User.all.order('max_party_size ASC')
        User.first.update_attributes(switcher: 0)
      else
        @users = User.all.order('max_party_size DESC')
        User.first.update_attributes(switcher:1)
      end

    elsif params['commit'] == 'Price'
      if User.first.switcher == 1
        @users = User.all.order('price_per_head ASC')
        User.first.update_attributes(switcher: 0)
      else
        @users = User.all.order('price_per_head DESC')
        User.first.update_attributes(switcher:1)
      end

    else
      @users = User.all
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @skillsets = Skillset.new()
    @user = current_user
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update_attributes(user_params)
        redirect_to user_path(@user)
      else
        render edit_user_registration
      end
    else
      redirect_to ('/')
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :location_lat, :location_lon,
       :max_party_size, :price_per_head, :bio, :avatar, :radius, {images: []})
  end
end
