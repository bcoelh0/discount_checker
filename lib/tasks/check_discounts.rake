namespace :check_discounts do
  task run: :environment do
    Product.all.each do |product|
      if product.discounted?
        AlertMailer.with(product: product).discount_email.deliver_now
      end
    end
  end
end