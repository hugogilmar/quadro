DynamicSitemaps::Sitemap.draw do
  last_updated_at = DateTime.now

  url root_url, last_mod: last_updated_at, change_freq: 'daily', priority: 1

  Quadro::Page.find_each do |page|
    url page_url(page), last_mod: page.updated_at, change_freq: 'monthly', priority: 0.5
  end
end
