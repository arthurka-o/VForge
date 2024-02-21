# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @user = User.includes(:traits).find(params[:id])
  end
end
