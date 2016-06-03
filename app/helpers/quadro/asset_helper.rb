module Quadro
  module AssetHelper
    def paperclip_url(style_url)
      URI.join(request.url, style_url)
    end
  end
end
