module Quadro
  module AssetHelper
    def paperclip_url(style_url)
      [request.base_url, style_url].join
    end
  end
end
