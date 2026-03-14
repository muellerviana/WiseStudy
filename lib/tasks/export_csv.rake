namespace :export do
  desc "Export a JSON file to CSV"
  task json_to_csv: :environment do
    require 'json'
    require 'csv'

    # Caminho do arquivo JSON de entrada
    json_file = Rails.root.join('db/data/bible_export.json')

    # Caminho do arquivo CSV de saída
    csv_file = Rails.root.join('db/data/output.csv')

    puts "📖 Reading JSON file from: #{json_file}"

    data = JSON.parse(File.read(json_file))

    unless data.is_a?(Array) && data.first.is_a?(Hash)
      raise "❌ Expected an array of objects in JSON file."
    end

    puts "🧩 Exporting to CSV..."

    CSV.open(csv_file, "w") do |csv|
      csv << data.first.keys # Cabeçalhos
      data.each do |row|
        csv << row.values.map do |value|
          value.is_a?(Hash) || value.is_a?(Array) ? value.to_json : value
        end
      end
    end

    puts "✅ CSV file created at: #{csv_file}"
  end
end
