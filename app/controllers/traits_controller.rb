# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_trait, only: %i[destroy]

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)

    @trait.save
  end

  def destroy
    @trait = Trait.find(params[:id])

    @trait.destroy
  end

  private

  def set_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:category, :name, :value, :emoji).merge(profile_id: Current.profile.id)
  end
end
