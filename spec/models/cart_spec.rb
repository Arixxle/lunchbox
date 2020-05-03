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
      # cat1 = Category.create(name: '湯麵')
      cat1 = FactoryBot.create(:category)
      i1 = cat1.items.create(name: 'item1', price: 100)
      i2 = cat1.items.create(name: 'item2', price: 80)
      #Act
      3.times {cart.add_item(i1.id)}#i1現在是items，所以有id這個方法(欄位)可以取用
      2.times {cart.add_item(i2.id)}
      #Assert
      expect(cart.items.first.item).to be_an Item 
      expect(cart.items.first.item.price).to be 100
    end
  end
  describe "進階功能" do
  end
end
