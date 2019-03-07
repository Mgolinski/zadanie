class OrderItem
	attr_reader :net_price, :quantity, :item_tax
	
	def initialize(p, q)
		@net_price = p
		@quantity = q
		@item_tax = 0.1
	end
	
	def net_total
		@net_price * @quantity
	end
	
	def item_tax_value
		net_total * @item_tax
	end
	
	def item_total
		net_total + net_total * @item_tax
	end
	
end

class Order
	attr_reader :items
	
	def initialize
		@items = []
	end
	
	def add_item(price, quantity)
		@items << OrderItem.new(price, quantity)
	end
	
	def net_total
		@sum = 0
		@items.each {|item| @sum += item.net_total}
		@sum
	end
	
	def tax
		@sum = 0
		@items.each {|item| @sum += item.item_tax_value}
		@sum
	end
	
	def total
		@sum = 0
		@items.each {|item| @sum += item.item_total}
		@sum
	end
	
end

order = Order.new
order.add_item 400, 2
order.add_item 20, 3

puts order.total
