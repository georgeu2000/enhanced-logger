require 'enhanced_logger/logger'
class Dog
  def woof
    EnhancedLogger::Logger.new.error('Bowowowow')
  end
end
