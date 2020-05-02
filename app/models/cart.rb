class Cart
  def initialize
    @items = [] #要有一個可以裝東西的容器
  end
  def add_item(item_id)
    @items << item_id
  end
  def empty?
    @items.empty? #陣列本身就有empty?方法
  end
  def items
    @items #回傳購物車的陣列內容
  end
end