class ApplicationController
  before_action { logger.set_env( env )}
  after_action  { logger.clear_env     }
end