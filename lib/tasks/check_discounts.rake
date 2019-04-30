namespace :check_discounts do
  task run: :environment do
    checker = Product.new url: "https://www.continente.pt/stores/continente/pt-pt/public/Pages/ProductDetail.aspx?ProductId=5032342(eCsf_RetekProductCatalog_MegastoreContinenteOnline_Continente)"
    p checker.discounted? 
  end
end