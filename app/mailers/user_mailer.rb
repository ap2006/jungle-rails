class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    @order = order
    @url = "http://localhost:3000/orders/#{order.id}"
    mail(to: 'andrew.matte@gmail.com', subject: 'Thanks for your order from Jungle')
    # mail(to: @order.email, subject: 'Thanks for your order from Jungle')
  end
end
