xml.instruct! :xml, version: "1.0", encoding: "utf-8"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
    xml.lastmod l(root.updated_at, format: :sitemap, locale: :en)
    xml.changefreq root.frequency
    xml.priority root.priority
  end

  root.descendants.published.ordered.each do |page|
    xml.url do
      xml.loc page_url(page)
      xml.lastmod l(page.updated_at, format: :sitemap, locale: :en)
      xml.changefreq page.frequency
      xml.priority page.priority
    end
  end
end
