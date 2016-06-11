xml.instruct! :xml, version: "1.0", encoding: "utf-8"
xml.rss version: "2.0" do
  xml.channel do
    xml.title root.title
    xml.description root.description
    xml.link Quadro.railtie_routes_url_helpers.root_url
    xml.image do
      xml.url absolute_url(root.cover.url(:small))
      xml.title root.title
      xml.link Quadro.railtie_routes_url_helpers.root_url
    end
    xml.generator Quadro.to_s

    root.descendants.ordered.each do |page|
      xml.item do
        xml.title page.title
        xml.description page.description
        xml.link Quadro.railtie_routes_url_helpers.page_url(page)
        xml.pubDate l(page.created_at, format: :long, locale: :en)
        xml.author page.author
      end
    end
  end
end
