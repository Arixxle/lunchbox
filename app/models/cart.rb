class Cart
  attr_reader :items
  def initialize(items = [])
    @items = items #要有一個可以裝東西的容器
  end
  def add_item(item_id)
    found_item = items.find { |item| item.item_id == item_id }
    if found_item
      found_item.increment! #去掉小括號，增加驚嘆好(表你要帶參數，若沒有參數，就會帶用預設值)
    else
      items << CartItem.new(item_id) #去掉quantity，沒給就會帶預設值
    end
  end
  def empty?
    items.empty? #陣列本身就有empty?方法
  end
  def total
    result = items.reduce(0) { |sum, item| sum + item.total }
    #題目：每年4/1全館打一折
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end
    return result
  end
  def to_hash
    items = @items.map{ |item| 
      { "item_id" => item.item_id, "quantity" => item.quantity }
    }
    return {"items" => items}
  end
  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = hash["items"].map { 
        |item| CartItem.new(item["item_id"], item["quantity"])
      }
      Cart.new(items)
    else
      Cart.new
    end
  end
end