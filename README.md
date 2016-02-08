### Rails Integration

1. Gemfile:   
    Add `gem 'enhanced-logger'`  
    Remove `gem 'rails_12factor'`

2. In Application Controller, add  
     `before_action { logger.set_env( env )}`   
     `after_action  { logger.clear_env     }`  

3. In `config/application.rb`, add  
     `config.logger = EnhancedLogger::Logger.new(EnhancedLogger::Logger::LEVELS[:info])`

4. Set log level in environment/production.rb, test.rb and/or development.rb.  
   Log levels are :debug, :info, :warn, :error, and :fatal.  
     `config.log_level = :debug`  

4. Use logger the same way as Rails logger.  
     `Rails.logger.info 'log message'`  

5. All HTTP requests to services running Enhanced Logger should set the X-Remote-Request-Id header.

----
### Rack Integration

1. Gemfile:   
    Add `gem 'enhanced-logger'`  

2. App:  
    `require 'enhanced-logger'`

3. Instantiate the logger. For example:  
    ```ruby
    class App
      @logger = EnhancedLogger::Logger.new( EnhancedLogger::Logger::LEVELS[ :error ])
    ```

4. Before each request is processed:  
    `@logger.set_env( env )`

5. After each request is processed:  
    `@logger.clear_env`

6. To use logger:  
    `@logger.info 'log message'`

7. All HTTP requests to services running Enhanced Logger should set the X-Remote-Request-Id header.

----
### rails_12factor gem

This gem does not work with the rails_12factor gem. 