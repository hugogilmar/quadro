xml.instruct! :xml, version: "1.0", encoding: "utf-8"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.id root.slug
  xml.title root.title
  xml.updated l(root.updated_at, format: :long)
  xml.subtitle root.description
  xml.link href: Quadro.railtie_routes_url_helpers.atom_url, rel: "self"
  xml.link href: Quadro.railtie_routes_url_helpers.root_url
  xml.icon absolute_url(root.cover.url(:thumb))
  xml.logo absolute_url(root.cover.url(:small))
  xml.generator Quadro.to_s

  root.descendants.ordered.each do |page|
    xml.entry do
      xml.id page.slug
      xml.title page.title
      xml.updated l(page.updated_at, format: :long)
      xml.published l(page.created_at, format: :long)
      xml.summary page.description
      xml.link href: Quadro.railtie_routes_url_helpers.page_url(page)
    end
  end
end
