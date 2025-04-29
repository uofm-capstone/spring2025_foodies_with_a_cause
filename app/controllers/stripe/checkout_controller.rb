class Stripe::CheckoutController < ApplicationController
  def pricing
    lookup_keys = %w[starter_monthly pro_monthly]

    @prices = Stripe::Price.list(
      lookup_keys: lookup_keys,
      active: true,
      expand: ['data.product']
      ).data.sort_by(&:unit_amount)
    
    render :pricing
  end

  def checkout
    session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: params[:price_id]
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
    })

    redirect_to session.url, status: 303, allow_other_host: true
  end

  def success
    flash[:notice] = "Checkout completed successfully"
    redirect_to pricing_path
  end

  def cancel
    flash[:alert] = "Checkout was canceled"
    redirect_to pricing_path
  end
end
