module Quadro
  class Asset::Image < Asset
    # attributes
    store :settings, accessors: [:width, :height, :alt]
    # attr_accessible :width, :height, :alt
    has_attached_file :attachment, styles: { thumb: '200x200#', small: '320x240>', medium: '640x480>', large: '800x600>' }, default_url: 'quadro/missing/image/:style.png'

    # validations
    validates :alt, length: { maximum: 60 }
    validates_attachment :attachment, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

    # methods
    class << self
      def short_name
        'image'
      end
    end
  end
end
