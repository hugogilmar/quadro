SitemapNotifier::Notifier.configure do |config|
  # Set URL to your sitemap. This is required.
  # config.sitemap_url = Quadro.railtie_routes_url_helpers.sitemap_url

  # Enabled in which environments – default is [:production]
  # config.environments = [:development, :production]

  # Delay to wait between notifications – default is 10 minutes
  config.delay = 2.minutes

  # Additional urls to ping
  # config.ping_urls << "http://localhost:3000/ping?sitemap=%{sitemap_url}"

  # If you don't want the notifications to run in the background
  config.background = false
end
