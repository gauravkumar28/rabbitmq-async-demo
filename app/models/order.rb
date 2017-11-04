class Order < ActiveRecord::Base

  def display id
    self.name
  end

  def self.list count
    Order.first(count).each do |x|
      x.name
    end
  end

  def update_name new_name
    self.name = new_name
    self.save
  end

  def self.create_order name
    order = Order.new
    order.name = name
    order.save!
  end

end