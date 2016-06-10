xml.instruct! :xml, version: "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.id Quadro.railtie_routes_url_helpers.page_url(root)
  xml.title root.title
  xml.updated root.updated_at
  xml.subtitle root.description
  xml.link Quadro.railtie_routes_url_helpers.atom_url, rel: "self"
  xml.link Quadro.railtie_routes_url_helpers.root_url, rel: "alternate"
  xml.icon  paperclip_url(root.cover.url(:thumb))
  xml.logo  paperclip_url(root.cover.url(:small))
  xml.generator Quadro.to_s

  root.descendants.each do |page|
    xml.entry do
      xml.id page.slug
      xml.title page.title
      xml.updated page.updated_at
      xml.published page.created_at
      xml.summary page.description
      xml.link Quadro.railtie_routes_url_helpers.page_url(page), rel: "alternate"
    end
  end
end
