puts "Restarting applications with changed prefs..."

apps = [
  "Activity Monitor", 
  "Address Book", 
  "Calendar", 
  "Contacts", 
  "Dock", 
  "Finder", 
  "Mail", 
  "Messages", 
  "Safari", 
  "Spectacle", 
  "SystemUIServer", 
  "Transmission", 
  "Twitter"
]

apps.each do |app|
  `killall #{app} > /dev/null 2>&1`
end
