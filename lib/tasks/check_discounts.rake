namespace :check_discounts do
  task run: :environment do
    Alert.all.each do |alert|
      if alert.product.discounted?
        AlertMailer.with(alert: alert).discount_email.deliver_now
      end
    end
  end
end
