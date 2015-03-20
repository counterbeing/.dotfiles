apps = [
  "Activity Monitor", 
  "Address Book", 
  "Calendar", 
  "Contacts", 
  "cfprefsd",
  "Dock", 
  "Finder", 
  "Mail", 
  "Messages", 
  "Safari", 
  "Spectacle", 
  "SystemUIServer", 
  "Terminal", 
  "Transmission", 
  "Twitter"
]

apps.each do |app|
  `killall #{app} > /dev/null 2>&1`
end
