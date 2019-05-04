class AlertMailer < ApplicationMailer
  default from: 'alerts@example.com'
 
  def discount_email
    @product = params[:product]
    @user = @product.user
    mail(to: @user.email, subject: 'Discount on product!')
  end
end
