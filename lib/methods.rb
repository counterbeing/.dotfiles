def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    }
  end
  return nil
end

if which("brew")
  INSTALLED_CASK_RECIPES =  `brew cask list`
  INSTALLED_RECIPES =  `brew list`
  INSTALLED_TAPS = `brew taps`
  INSTALLED_APPLICATIONS = Dir.entries("/Applications").join('').gsub(' ', '-').downcase
end

