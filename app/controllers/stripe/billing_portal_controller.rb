class Stripe::BillingPortalController < ApplicationController
  def create
    session = Stripe::BillingPortal::Session.create({
                                                      customer: current_user.stripe_customer_id,
                                                      return_url: user_url(current_user),
                                                    })

    redirect_to session.url, status: 303, allow_other_host: true
  end
end
