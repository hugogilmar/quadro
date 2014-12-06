module Quadro
  class Asset::Image < Asset
    # attributes
    store :settings, accessors: [:width, :height, :alt]
    has_attached_file :attachment, styles: { small: "200x150>", large: "400x300>" }

    # validations
    validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  end
end
