# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)

      respond_to do |format|
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Current.user.profile
  end

  def profile_params
    params.require(:profile).permit(:username, :avatar, traits_attributes: %i[id name value])
  end
end
