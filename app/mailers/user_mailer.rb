class UserMailer < ApplicationMailer

  default from: 'cute@animals.com'
 
  def product_email
    @product = params[:product]
    @user = params[:user]
    mail(to: @user.email, subject: "Your requested infos")
  end

end