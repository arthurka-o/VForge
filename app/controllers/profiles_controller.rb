# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @profile.update(profile_params)
  end

  private

  def set_profile
    @profile = Current.user.profile
  end

  def profile_params
    params.require(:profile).permit(:username, :avatar, traits_attributes: %i[id name value])
  end
end
