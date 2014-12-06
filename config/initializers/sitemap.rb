DynamicSitemaps::Sitemap.draw do
  root = Quadro::Page.roots.first

  url Quadro.railtie_routes_url_helpers.root_url(host: ENV['host']), last_mod: root.updated_at, change_freq: root.frecuency, priority: root.priority

  root.children.find_each do |page|
    url Quadro.railtie_routes_url_helpers.page_url(host: ENV['host'], id: page), last_mod: page.updated_at, change_freq: page.frecuency, priority: page.priority
  end
end
