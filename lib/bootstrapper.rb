# Chooses when to execute a class
module Bootstrapper
  require 'rbconfig'

  def run
    puts "#{Tty.blue}#{self::MESSAGE}#{Tty.reset}"
    if callable?
      new.call
      return
    end
    puts 'skipping, due to platform mismatch'
  end

  def runnable?(run_classes)
    return true unless defined?(self::DEPENDENCIES)
    return true if self::DEPENDENCIES.empty?
    Array(self::DEPENDENCIES).all? do |dep|
      klass = Kernel.const_get dep.split('_').map(&:capitalize).join
      run_classes.include?(klass)
    end
  end

  private

  def callable?
    return true unless defined? self::PLATFORMS
    return true if self::PLATFORMS.include?(platform)
    false
  end

  def platform
    @os ||= begin
      case RbConfig::CONFIG['host_os']
      when /darwin|mac os/
        :macos
      when /linux/
        :linux
      else
        abort 'Your OS is not supported'
      end
    end
  end
end
