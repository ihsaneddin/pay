module Pay
  module Processors
    module Stripe
      include Env

      extend self

      def setup
        ::Stripe.api_key = private_key
        ::Stripe.api_version = "2020-08-27"
        ::Stripe.set_app_info("PayRails", partner_id: "pp_partner_IqhY0UExnJYLxg", version: Pay::VERSION, url: "https://github.com/pay-rails/pay")
      end

      def public_key
        find_value_by_name(:stripe, :public_key)
      end

      def private_key
        find_value_by_name(:stripe, :private_key)
      end

      def signing_secret
        find_value_by_name(:stripe, :signing_secret)
      end
    end
  end
end