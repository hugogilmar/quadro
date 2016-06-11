xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.rss "xmlns:webfeeds" => "http://webfeeds.org/rss/1.0", "version" => "2.0" do
  xml.channel do
    xml.title root.title
    xml.description root.description
    xml.link Quadro.railtie_routes_url_helpers.root_url
    xml.image do
      xml.url absolute_url(root.cover.url(:small))
      xml.title root.title
      xml.link Quadro.railtie_routes_url_helpers.root_url
    end
    xml.webfeeds :cover, image: absolute_url(root.cover.url(:small))
    xml.webfeeds :icon, absolute_url(image_path('quadro/quadro-logo.png'))
    xml.generator Quadro.to_s

    root.descendants.ordered.each do |page|
      xml.item do
        xml.title page.title
        xml.description page.description
        xml.link Quadro.railtie_routes_url_helpers.page_url(page)
        xml.pubDate page.created_at
        xml.author page.author
      end
    end
  end
end
