# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_user_trait, only: %i[destroy]

  def new
    @user_trait = User::Trait.new
  end

  def create
    @user_trait = User::Trait.new(user_trait_params)

    if @user_trait.save
      render 'users/edit'
    else
      render :new
    end
  end

  def destroy
    @user_trait = User::Trait.find(params[:id])

    @user_trait.destroy

    turbo_stream
  end

  private

  def set_user_trait
    @user_trait = User::Trait.find(params[:id])
  end

  def user_trait_params
    params.require(:user_trait).permit(:category, :name, :value, :emoji).merge(user_id: Current.user.id)
  end
end
