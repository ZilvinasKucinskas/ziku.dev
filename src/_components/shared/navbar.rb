class Shared::Navbar < Bridgetown::Component
  def initialize(metadata:, resource:, links:)
    @metadata, @resource, @links = metadata, resource, links
  end
end
