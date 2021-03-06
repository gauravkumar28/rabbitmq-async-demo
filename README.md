# README
create rabbitmq-async.rb  in config/initializers and paste 
``` ruby
require 'yaml'
$consumer_config = YAML.load_file("#{Rails.root}/config/consumer.yml")
```
##consumer.yml
```ruby
consumer:
  user:
    routing_key: "myroute1"
    self_exchange: "selfexchange2"
    queue: "myqueue1"
  comment:
    routing_key: "myroute2"
    self_exchange: "selfexchange2"
    queue: "myqueue2"
  generic:
    routing_key: "myroute3"
    self_exchange: "selfexchange3"
    queue: "myqueue3"
  order:
    routing_key: "myroute4"
    self_exchange: "selfexchange4"
    queue: "myqueue4"
 ```  
 ## Rake task to launch consumers
 ```ruby
  rake rabbitmq:consumer name=order
 ```
 ## Rake task to test the application
 ```ruby
 rake rabbitmq:async_test
 ```
 
 ##Example
 ```ruby 
    Order.perform_async("list", 1) 
    order = Order.first
    Order.perform_async("create_order", "my_order")
    order.perform_async("update_name", "zak")
    order.perform_async("display", 2)
  ```
