module Quadro
  class Asset::Slide < Asset
    # attributes
    store :settings, accessors: [:width, :height, :alt, :href]
    attr_accessible :width, :height, :alt, :href
    has_attached_file :attachment, styles: { thumb: "200x200#", small: "640x480>", medium: "800x600>", large: "1024x768>" }, default_url: '//placehold.it/1024x768'

    # validations
    validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

    class << self
      def short_name
        "slide"
      end
    end
  end
end
