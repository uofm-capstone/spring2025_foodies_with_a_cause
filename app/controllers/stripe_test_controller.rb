class StripeTestController < ApplicationController
  def connection_test
    begin
      @api_keys_set = ENV['STRIPE_PUBLISHABLE_KEY'].present? && ENV['STRIPE_SECRET_KEY'].present?
      
      if @api_keys_set
        customers = Stripe::Customer.list(limit: 1)
        @test_successful = true
        @response_data = customers.to_s[0..100] # Show first 100 chars of response
      else
        @test_successful = false
      end
    rescue Stripe::StripeError => e
      @error_message = e.message
      @test_successful = false
    rescue => e
      @error_message = "Unexpected error: #{e.message}"
      @test_successful = false
    end
  end
end
