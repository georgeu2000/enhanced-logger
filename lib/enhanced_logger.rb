module EnhancedLogger  
  require 'enhanced_logger/logger'

  if defined?(Rails)
    require 'rails/application_controller'
  else
    # require 'our_gem/difficult_stuff'
  end
end

puts 'Loading Enhanced Logger.'