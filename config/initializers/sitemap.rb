DynamicSitemaps::Sitemap.draw do
  root = Quadro::Page.roots.first

  url Quadro.railtie_routes_url_helpers.root_url, last_mod: root.updated_at, change_freq: root.frequency, priority: root.priority

  root.children.find_each do |page|
    url Quadro.railtie_routes_url_helpers.page_url(page), last_mod: page.updated_at, change_freq: page.frequency, priority: page.priority
  end
end
