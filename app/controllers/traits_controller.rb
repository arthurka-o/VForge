# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_trait, only: %i[destroy]

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)

    @trait.save
    render "home/index"
    # if @trait.save
    #   respond_to do |format|
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.append("traits", partial: "trait", locals: { trait: @trait })
    #     end
    #     format.html { redirect_to edit_profile_path }
    #   end
    # else
    #   render :new
    # end
  end

  def destroy
    @trait.destroy

    redirect_to root_path
    # redirect_to edit_profile_path
  end

  private

  def set_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:category, :name, :value, :emoji).merge(profile_id: Current.profile.id)
  end
end
