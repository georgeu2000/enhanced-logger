describe 'Logger' do
  before do
    @logger = EnhancedLogger::Logger.new
  end

  describe 'most_recent_caller' do
    specify 'Should filter out gems' do
      expect( @logger.most_recent_caller ).to eq "logger_spec.rb:#{__LINE__}:in `block (3 levels) in <top (required)>'"
    end
  end

  describe 'Format' do
    specify 'Debug should have EnhancedLogger format' do
      @logger.level = 0
      expect { @logger.debug('foo') }.to output("  logger_spec block (4 levels) in <top (required)> #{__LINE__}: foo\n").to_stdout
    end

    specify 'Info should have EnhancedLogger format' do
      expect { @logger.info('foo') }.to output("  logger_spec block (4 levels) in <top (required)> #{__LINE__}: foo\n").to_stdout
    end

    specify 'Warn should have EnhancedLogger format' do
      expect { @logger.warn('foo') }.to output("  logger_spec block (4 levels) in <top (required)> #{__LINE__}: foo\n").to_stdout
    end

    specify 'Error should have EnhancedLogger format' do
      expect { @logger.error('foo') }.to output("  logger_spec block (4 levels) in <top (required)> #{__LINE__}: foo\n").to_stdout
    end

    specify 'Fatal should have EnhancedLogger format' do
      expect { @logger.fatal('foo') }.to output("  logger_spec block (4 levels) in <top (required)> #{__LINE__}: foo\n").to_stdout
    end

    specify 'If message is blank, do not output the prefix' do
      expect { @logger.debug('') }.to output('').to_stdout
      expect { @logger.info('')  }.to output('').to_stdout
      expect { @logger.warn('')  }.to output('').to_stdout
      expect { @logger.error('') }.to output('').to_stdout
      expect { @logger.fatal('') }.to output('').to_stdout
    end
  end

  describe 'Should have the proper output for Dog' do
    specify do
      expect { Dog.new.woof }.to output("  mock woof 4: Bowowowow\n").to_stdout
    end
  end
end
