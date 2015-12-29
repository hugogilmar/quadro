module Quadro
  class Asset::Cover < Asset
    # attributes
    store :settings, accessors: [:width, :height, :alt]
    has_attached_file :attachment, styles: { small: "800x600>", medium: "1024x768>", large: "1280x1024>" }

    # validations
    validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  end
end
