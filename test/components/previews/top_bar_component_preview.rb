class TopBarComponentPreview < ViewComponent::Preview
  def standard
    render TopBarComponent.new(title: "topbar test")
  end
end