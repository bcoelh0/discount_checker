class AlertMailer < ApplicationMailer
  default from: 'alerts@example.com'

  def discount_email
    @alert = params[:alert]
    @user = @alert.user
    @product = @alert.product
    mail(to: @user.email, subject: "Discount on #{@alert.name}!")
  end
end
