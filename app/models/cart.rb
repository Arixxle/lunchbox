class Cart
  def initialize(items = [])
    @items = items #要有一個可以裝東西的容器
  end
  def add_item(item_id)
    found_item = @items.find { |item| item.item_id == item_id }
    if found_item
      found_item.increment! #去掉小括號，增加驚嘆好(表你要帶參數，若沒有參數，就會帶用預設值)
    else
      @items << CartItem.new(item_id) #去掉quantity，沒給就會帶預設值
    end
  end
  def empty?
    @items.empty? #陣列本身就有empty?方法
  end
  def items
    @items #回傳購物車的陣列內容
  end
  def total
    result = @items.reduce(0) { |sum, item| sum + item.total }
    #題目：每年4/1全館打一折
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end
    return result
  end
  def to_hash
    # items = []
    # @items.each do |item|
    #   items << { "item_id" => item.item_id, 
    #              "quantity" => item.quantity},
    # end
    items = @items.map{ |item| 
      { "item_id" => item.item_id, "quantity" => item.quantity }
    }
    return {"items" => items}
  end
  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = []
      hash["items"].each do |item|
        #這裡的item是：{ "item_id" => 1, "quantity" => 3},因為前面是傳一個包著hash的陣列進來
        items << CartItem.new(item["item_id"], item["quantity"])
        #因為要還原成購物車，所以要把購物車中的購物項目先做出來
      end
      Cart.new(items)
    else
      Cart.new
    end
  end
end