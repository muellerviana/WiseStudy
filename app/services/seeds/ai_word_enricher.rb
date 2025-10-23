# app/services/story_generator_service.rb
require "openai"

class StoryGeneratorService
  def initialize(prompt = "Write a one-sentence bedtime story about a unicorn.")
    @prompt = prompt
    @client = OpenAI::Client.new
  end

  def call
    puts "🪄 Asking GPT-5 for a story..."
    response = @client.responses.create(
      model: "gpt-5",
      input: @prompt
    )

    story_text = response.dig("output_text")

    if story_text.present?
      { success: true, text: story_text }
    else
      { success: false, error: "No text returned from GPT." }
    end
  rescue => e
    { success: false, error: e.message }
  end
end
