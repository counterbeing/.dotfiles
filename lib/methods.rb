#! /usr/bin/env ruby
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

HOME = File.expand_path('~')
def backup(file)
  puts "backing up #{file}"
  if File.exist?(file)
    FileUtils.mv(file, "#{file}_backup_#{Time.now.to_i}")
  end
end

# Check to see if the symlink even needs to be replaced
def symlink_already_matchs(source, target)
  if File.symlink?(target)
    File.readlink(target) == source
  end
end

# Source is orginial file, target is where the link goes
def make_link_where_appropriate(source, target)
  unless symlink_already_matchs(source, target)
    backup(target)
    FileUtils.symlink(source, target, verbose: true)
  else
    puts "#{target} is already set"
  end
end

def copy_file_with_backup(source, target)
  if File.exist?(target)
    backup(target)
  end
  FileUtils.cp(source, target)
end
