namespace :rabbitmq  do
  desc "create some fake data"
  task :async_test => :environment do  
    Order.perform_async("list", 1) 
    order = Order.first
    Order.perform_async("create_order", "my_order")
    order.perform_async("update_name", "zak")
    order.perform_async("display", 2)
  end
end