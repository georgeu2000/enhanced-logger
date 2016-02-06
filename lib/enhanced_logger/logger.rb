module EnhancedLogger
  class Logger
    LEVELS = { debug:0, info:1, warn:2, error:3, fatal:4, unknown:5 }.freeze

    attr_accessor :level

    def initialize level=1
      @level = level
      $stdout.sync = true
    end

    def set_env env
      @request_id = env[ 'HTTP_X_REQUEST_ID' ]
      @remote_request_id = env[ 'HTTP_X_REMOTE_REQUEST_ID' ]
    end

    def clear_env
      @request_id = nil
      @remote_request_id = nil
    end

    def debug?
      @level <= LEVELS[ :debug ]
    end

    def info?
      @level <= LEVELS[ :info ]
    end

    def warn?
      @level <= LEVELS[ :warn ]
    end

    def error?
      @level <= LEVELS[ :error ]
    end

    def fatal?
      @level <= LEVELS[ :fatal ]
    end


    def debug msg=nil
      puts formatted( msg ) if debug?
    end

    def info msg=nil
      puts formatted( msg ) if info?
    end

    def warn msg=nil
      puts formatted( msg ) if warn?
    end

    def error msg=nil
      puts formatted( msg ) if error?
    end

    def fatal msg=nil
      puts formatted( msg ) if fatal?
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