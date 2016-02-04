##### Rails Integration

1. Gemfile:   
    Add `gem 'enhanced-logger'`  
    Remove `gem 'rails_12factor'`

2. In Application Controller, add
     `before_action { logger.set_env( env )}  `
     `after_action  { logger.clear_env     }`

3. In `config/application.rb`, add
    `config.logger = EnhancedLogger::Logger.new(STDOUT)`

### rails_12factor gem

This gem does not work with the rails_12factor gem. 

