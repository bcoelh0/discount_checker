require 'rails_helper'

RSpec.describe Product, type: :model do
  context "validation tests" do
    let!(:user){ User.create(email: "johndoe@gmail.com") }

    it "ensures URL presence" do
      product = user.products.new(url: "").save
      expect(product).to eq false
    end

    it "ensures URL from continente.pt" do
      product = user.products.new(url: "http://google.com").save
      expect(product).to eq false
    end

    it "ensures URL has protocol" do
      product = user.products.new(url: "google.com").save
      expect(product).to eq false
    end

    it "should save successfully" do
      url = "https://www.continente.pt/stores/continente/pt-pt/public/Pages/ProductDetail.aspx?ProductId=6244700(eCsf_RetekProductCatalog_MegastoreContinenteOnline_Continente)"
      product = user.products.new(url: url).save
      expect(product).to eq true
    end
  end

  context "tests discount checking" do
    pending "gets a discounted product"
    # implement test on discounts
  end
end
