# Chooses when to execute a class
module Bootstrapper
  require 'rbconfig'

  def run
    puts "#{Tty.blue}#{self::MESSAGE}#{Tty.reset}"
    new.call && return if callable?
    puts 'skipping, platform mismatch'
  end

  private

  def callable?
    return true unless defined? self::PLATFORMS
    return true if self::PLATFORM.include?(platform)
    false
  end

  def platform
    @os ||= begin
      case RbConfig::CONFIG['host_os']
      when /darwin|mac os/
        :macosx
      when /linux/
        :linux
      else
        abort 'Your OS is not supported'
      end
    end
  end
end
