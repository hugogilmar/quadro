module Quadro
  module AssetHelper
    def absolute_url(relative_url)
      [request.base_url, relative_url].join
    end
  end
end
