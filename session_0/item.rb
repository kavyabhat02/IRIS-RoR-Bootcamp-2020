class Item
   CATEGORIES = {
   1 => 'Electronics/Gadgets',
   2 => 'Books',
   3 => 'Furniture',
   4 => 'Miscellaneous'
  }
  
  attr_accessor :name, :price, :category_id, :discount_rate,
  :discount_deadline, :quantity
  
  def initialize(name: '', price:0, quantity:1, category_id:4, 
                 discount_rate:0, discount_deadline: Time.now)
   @name = name
   @price = price
   @category_id = category_id
   @discount_rate = discount_rate
   @discount_deadline = discount_deadline
   @quantity = quantity
  end 
  
  def discounted?
    if(Time.now >= discount_deadline)
        return false
    elsif(Time.now <= discount_deadline)
        return true
    end
  end
  
  def current_price
    if(discounted?)
      return price * (100-discount_rate)/100
    else
      return price
    end
  end
  
  def self.stock_price_by_category(items)
     final = {
       1 => 0,
       2 => 0,
       3 => 0,
       4 => 0
     }
     items.each do |i|
       final[i.category_id] += i.quantity * i.current_price
     end
     return final
  end
end
