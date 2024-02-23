# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)

      respond_to do |format|
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.includes(:traits).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :avatar, traits_attributes: %i[id name value _destroy])
  end
end
