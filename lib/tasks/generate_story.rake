require "openai"

namespace :generate do
  desc "Generate a bedtime story with GPT-5 and save it to the database"
  task story: :environment do
    client = OpenAI::Client.new

    puts "🪄 Generating a bedtime story..."

    begin
      response = client.responses.create(
        model: "gpt-3.5-turbo",
        input: "Write a one-sentence bedtime story about a unicorn."
      )

      story_text = response.output_text

      if story_text.nil? || story_text.strip.empty?
        puts "⚠️ No story text returned from GPT."
      else
        puts(
          
          "this is story_body: #{story_text.strip}"
        )

        puts "✅ Story created successfully i think"
      end

    rescue => e
      puts "❌ Error generating story: #{e.message}"
    end
  end
end
