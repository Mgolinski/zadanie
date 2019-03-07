require File.expand_path(__dir__) + "/zadanie.rb"
require "test/unit"

class TestZadanie < Test::Unit::TestCase

	def setup
		@order0 = Order.new
		@order1 = Order.new
		@order2 = Order.new
				
		@order1.add_item(19, 2)
	
  	@order2.add_item(19, 2)
		@order2.add_item(5, 3)
	end

	def test_new_order
		assert_equal(0, @order0.items.length)
		assert_equal([], @order0.items)
	end
	
	def test_one_order_item
		assert_equal(1, @order1.items.length)
		assert_equal(19, @order1.items[0].net_price)
		assert_equal(2, @order1.items[0].quantity)
		assert_equal(38, @order1.items[0].net_total)
		assert_equal(38, (10*@order1.items[0].item_tax_value).to_i)
		assert_equal(41.8, @order1.items[0].item_total)
		assert_equal(38, (10 * @order1.tax).to_i)
		assert_equal(41.8, @order1.total)
	end

	def test_two_order_items
		assert_equal(2, @order2.items.length)
		assert_equal(5, @order2.items[1].net_price)
		assert_equal(3, @order2.items[1].quantity)
		assert_equal(15, @order2.items[1].net_total)
		assert_equal(15, (10 * @order2.items[1].item_tax_value).to_i)
		assert_equal(16.5, @order2.items[1].item_total)
		assert_equal(15+38, (10 * @order2.tax).to_i)
		assert_equal(41.8+16.5, @order2.total)
	end

	def test_ArgumentError_raise
		@order = Order.new
		assert_raise(ArgumentError) {@order.add_item(1)}
	end

end