module Quadro
  class Asset::Cover < Asset
    # attributes
    store :settings, accessors: [:width, :height, :alt]
    # attr_accessible :width, :height, :alt
    has_attached_file :attachment, styles: { thumb: '200x200#', small: '800x600>', medium: '1024x768>', large: '1280x1024>' }, default_url: 'quadro/missing/cover/:style.png', use_timestamp: false

    # validations
    validates :alt, length: { maximum: 60 }
    validates_attachment :attachment, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

    # methods
    class << self
      def short_name
        'cover'
      end
    end
  end
end
