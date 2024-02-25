# frozen_string_literal: true

class PasswordMailer < ApplicationMailer
  def password_reset
    @user = params[:user]
    @token = params[:token]

    mail to: @user.email, subject: "Reset your password"
  end
end
