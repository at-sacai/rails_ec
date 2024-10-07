# frozen_string_literal: true

class PurchaseMailer < ApplicationMailer
  def thanks_email
    @order = params[:order]
    mail(
      to: @order.email,
      subject: 'Thank you for your purchase.'
    )
  end
end
