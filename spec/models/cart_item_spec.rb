require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "每個 Cart Item 都可以計算它自己的金額（小計）。"do
    #Arrange 第一步先把購物車跟商品生出來
    cart = Cart.new
    i1 = FactoryBot.create(:item, price: 50)
    i2 = FactoryBot.create(:item, price: 100)
    #Act
    3.times {cart.add_item(i1.id)}
    2.times {cart.add_item(i2.id)}
    #Assert
    expect(cart.items.first.total).to be 150
  end
end
