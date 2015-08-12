module StripePayment

  def gateway
    gateway = ActiveMerchant::Billing::StripeGateway.new(:login => 'sk_test_XNz492WN3mUPvMdGSkxK0R9H')
  end

  def credit_card(params)
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                  :first_name         => params[:first_name],
                  :last_name          => params[:last_name],
                  :number             => params[:number],
                  :month              => params[:month],
                  :year               => params[:year],
                  :verification_value => '000')
  end
end