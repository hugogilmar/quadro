DynamicSitemaps::Sitemap.draw do
  last_updated_at = DateTime.now

  url Quadro.railtie_routes_url_helpers.root_url(host: ENV['host']), last_mod: last_updated_at, change_freq: 'daily', priority: 1

  Quadro::Page.find_each do |page|
    url Quadro.railtie_routes_url_helpers.page_url(host: ENV['host'], id: page), last_mod: page.updated_at, change_freq: 'monthly', priority: 0.5
  end
end
