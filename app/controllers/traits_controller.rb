# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_user_trait, only: %i[destroy]

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
    params.require(:user_trait).permit(:user_id, :trait_id, :value)
  end
end
