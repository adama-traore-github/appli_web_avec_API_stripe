class PaymentsController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    # Assurez-vous que 'amount' et 'stripeToken' sont présents dans les paramètres
    amount = params[:amount].to_i * 100
    stripe_token = params[:stripeToken]

    if amount <= 0 || stripe_token.blank?
      flash[:alert] = "Invalid payment details"
      redirect_to new_payment_path
      return
    end

    begin
      charge = Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        source: stripe_token,
        description: 'Payment description'
      )
      flash[:notice] = "Payment successful"
    rescue Stripe::CardError => e
      flash[:alert] = e.message
    end

    redirect_to new_payment_path
  end
end
