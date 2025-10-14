require 'rake'

# Load additional seed files
Dir[Rails.root.join('db/seeds/*.rb')].each do |file|
  puts "Seeding: #{File.basename(file)}"
  load file
end

#load strongs entries
['greek', 'hebrew'].each do |lang|
  Rake::Task['import:strongs'].reenable
  Rake::Task['import:strongs'].invoke(lang)
end

#load testus receptus (NT)
Rake::Task['import:textus_receptus'].reenable
Rake::Task['import:textus_receptus'].invoke
