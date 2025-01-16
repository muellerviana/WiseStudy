class Sermon < ApplicationRecord
  def display_attributes
    {
      title: title,
      description: description
    }
  end
end
