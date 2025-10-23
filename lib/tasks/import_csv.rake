namespace :import do
  desc "Import a CSV file back to JSON"
  task csv_to_json: :environment do
    require 'csv'
    require 'json'

    # Caminho do arquivo CSV de entrada
    csv_file = Rails.root.join('db/data/output.csv')

    # Caminho do arquivo JSON de saída
    json_file = Rails.root.join('db/data/reimported.json')

    puts "📦 Reading CSV file from: #{csv_file}"

    csv_data = CSV.read(csv_file, headers: true)

    puts "🔄 Converting CSV back to JSON..."

    json_data = csv_data.map do |row|
      row.to_h.transform_values do |value|
        begin
          parsed = JSON.parse(value)
          parsed
        rescue JSON::ParserError
          value
        end
      end
    end

    File.write(json_file, JSON.pretty_generate(json_data))

    puts "✅ JSON file created at: #{json_file}"
  end
end
