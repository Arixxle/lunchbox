require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do
      #Arrange
      cart = Cart.new
      #Act
      cart.add_item(1)
      #Assert
      expect(cart.empty?).to be false
    end
    it "加相同種類商品，購買項目不會增加，但商品數量會改變。"  do
      cart = Cart.new
  
      3.times {cart.add_item(1)}
      2.times {cart.add_item(2)}
      2.times {cart.add_item(1)}

      expect(cart.items.count).to be 2
    end
    it "商品可以放到購物車裡，也可以再拿出來。" do
      cart = Cart.new
      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)
      #Act
      3.times {cart.add_item(i1.id)}#i1現在是items，所以有id這個方法(欄位)可以取用
      2.times {cart.add_item(i2.id)}
      #Assert
      expect(cart.items.first.item).to be_an Item 
      expect(cart.items.first.item.price).to be i1.price
    end
    it "可以計算整台購物車的總消費金額。" do
      cart = Cart.new
      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)
    
      3.times { cart.add_item(i1.id)}
      2.times { cart.add_item(i2.id)}
    
      expect(cart.total).to be 350
    end
  end
  describe "進階功能" do
  end
end
