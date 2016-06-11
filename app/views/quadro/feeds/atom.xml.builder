xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.feed "xmlns:webfeeds" => "http://webfeeds.org/rss/1.0", "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.id root.slug
  xml.title root.title
  xml.updated root.updated_at
  xml.subtitle root.description
  xml.link href: Quadro.railtie_routes_url_helpers.atom_url, rel: "self"
  xml.link href: Quadro.railtie_routes_url_helpers.root_url
  xml.icon  absolute_url(root.cover.url(:thumb))
  xml.logo  absolute_url(root.cover.url(:small))
  xml.webfeeds :cover, image: absolute_url(root.cover.url(:small))
  xml.webfeeds :icon, absolute_url(image_path('quadro/quadro-logo.png'))
  xml.generator Quadro.to_s

  root.descendants.ordered.each do |page|
    xml.entry do
      xml.id page.slug
      xml.title page.title
      xml.updated page.updated_at
      xml.published page.created_at
      xml.summary page.description
      xml.link href: Quadro.railtie_routes_url_helpers.page_url(page)
    end
  end
end
