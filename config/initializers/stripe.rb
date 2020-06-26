Rails.configuration.stripe = {
  :publishable_key => ENV['stripe_publishable_key'],
  :secret_key      => ENV['STRIPE_API_KEY']
}

Stripe.api_key = ENV['STRIPE_API_KEY']