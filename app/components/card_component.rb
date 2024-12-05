class CardComponent < ViewComponent::Base
  renders_one :actions

  STYLES = {
    basic: ['w-44 h-60 flex flex-col'],
    bordered: ['w-64 h-96 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 flex flex-col']
  }.freeze

  def initialize(title:, description: nil, link:, image:, style: :basic, **args)
    @title = title
    @description = description
    @link = link
    @style = "#{style_class(style)} #{args.delete(:class)}".strip
    @image = image
    @html_options = args

    super(**args)
  end

  private

  def style_class(style)
    STYLES[style.to_sym].join('')
  end
end