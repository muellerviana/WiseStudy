# Load additional seed files
Dir[Rails.root.join('db/seeds/*.rb')].each do |file|
  puts "Seeding: #{File.basename(file)}"
  load file
end
