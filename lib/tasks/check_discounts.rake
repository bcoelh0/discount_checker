namespace :check_discounts do
  task run: :environment do

    Product.all.each do |p|
      if p.discounted?
        puts "Discounted: #{p.url}"
      end
    end
  end
end