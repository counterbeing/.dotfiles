puts "Installing ruby..."
installed_versions = `rbenv versions`
versions = [
  "2.1.5",
  "2.2.1"
]

versions.each do |version|
  unless installed_versions.include?(version)
    puts "    Installing version #{version} within rbenv."
    `rbenv install #{version}`
  end
end
