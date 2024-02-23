# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_trait, only: %i[destroy]

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)

    if @trait.save
      render 'users/edit'
    else
      render :new
    end
  end

  def destroy
    @trait = Trait.find(params[:id])

    @trait.destroy

    turbo_stream
  end

  private

  def set_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:category, :name, :value, :emoji).merge(user_id: Current.user.id)
  end
end
