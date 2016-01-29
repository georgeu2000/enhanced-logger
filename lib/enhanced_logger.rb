puts __FILE__

module EnhancedLogger  
  require 'enhanced_logger/logger'
  
  if defined?(Rails)
  else
    # require 'our_gem/difficult_stuff'
  end
end

puts 'Loading Enhanced Logger.'