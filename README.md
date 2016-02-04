##### Rails Integration

1. Gemfile:   
    Add `gem 'enhanced-logger'`  
    Remove `gem 'rails_12factor'`

2. In Application Controller, add  
     `before_action { logger.set_env( env )}`   
     `after_action  { logger.clear_env     }`  

3. In `config/application.rb`, add  
    `config.logger = EnhancedLogger::Logger.new(STDOUT)`

4. Use logger the same way as Rails logger.`  
     `Rails.logger.info 'log message'`

5. All HTTP requests to services running Enhanced Logger should set the X-Remote-Request-Id header.


##### Rack Integration

1. Gemfile:   
    Add `gem 'enhanced-logger'`  

2. Before each request is processed:  
    `@logger = EnhancedLogger::Logger.new(STDOUT)`
    `@logger.set_env( env )`

3. After each request is processed:  
    `@logger.clear_env`

4. To use logger:  
    `@logger.info  'log message'`


##### rails_12factor gem

This gem does not work with the rails_12factor gem. 