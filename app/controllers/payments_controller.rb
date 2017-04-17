class PaymentsController < ApplicationController
	
  def new
  end

  def create
  # Amount in cents

  amount = 500
  customer = Stripe::Customer.create(:email => params[:stripeEmail],:source  => params[:stripeToken])
  charge = Stripe::Charge.create(:customer    => customer.id,:amount => amount,:description => 'Rails Stripe customer',:currency => 'usd')
  @payment = current_user.payments.new(amount: amount)
  @payment.save  
  
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_payment_path
  end

  # def stripe_payment    
  #   # Get the credit card details submitted by the form
  #   Stripe.api_key = "sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxx"
  #   token = params[:stripeToken]
  #   #Get existing stripe customer    
  #   customers = Stripe::Customer.all

  #   @customers = customers.select do |c|
  #     c.email.eql?(params[:stripeEmail])    
  #   end
    
  #   if @customers.present?
  #     customer = @customers.first
  #   else
  #     customer = Stripe::Customer.create( :source => token, :email => params[:stripeEmail] )
  #   end

  #   if params[:plan_id]
  #     # Create a Customer Subscription
  #     subscription = customer.subscriptions.create( :plan => params[:plan_id], :metadata => {'plan_id' => params[:plan_id], receipt_email: params[:stripeEmail]} )
  #   else
  #     # Charge the Customer instead of the card
  #     Stripe::Charge.create(:amount => params[:amount].to_i*100, :currency => params[:currency],:customer => customer.id, :description => params[:description], :metadata => {'prod_id' => params[:product_id]}, receipt_email: params[:stripeEmail] )
  #   end
    
  #   redirect_to root_path, flash: { notice: "Payment done." }
  # end

end
