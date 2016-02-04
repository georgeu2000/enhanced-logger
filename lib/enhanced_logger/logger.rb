module EnhancedLogger
  class Logger
    attr_accessor :level

    def initialize dest
      # puts __method__
      $stdout.sync = true
    end

    def set_env env
      # puts __method__
      @request_id = env[ 'HTTP_X_REQUEST_ID' ]
      @remote_request_id = env[ 'HTTP_X_REMOTE_REQUEST_ID' ]
    end

    def clear_env
      puts __method__
    end

    def info msg = nil
      return unless msg

      puts formatted( msg )
    end

    def info?
      true
    end

    def debug?
      true
    end

    def debug msg
      puts formatted( msg )
    end

    def error msg
      puts formatted( msg )
    end

    def fatal msg
      puts formatted( msg )
    end

    def formatter
      ''
    end


    private

    def formatted msg
      previous =  caller[ 1 ].split( '/' ).last
      parts  = previous.split( /[\.|:]/ )
      method = previous.split( /`/ ).last.gsub( "'", "" )

      "#{ @remote_request_id } #{ @request_id } #{ parts[ 0 ]} #{ method } #{ parts[ 2 ]}: #{ msg }"
    end
  end
end