module Quadro
  class Page < ActiveRecord::Base
    # constants
    PAGE_TEMPLATES_PATH = "app/views/quadro/shared/templates/"
    SITEMAP_FRECUENCY = ["always", "hourly", "daily", "weekly", "monthly", "yearly", "never"]
    SITEMAP_PRIORITY = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

    # attributes
    attr_accessible :title, :description, :template, :frequency, :priority
    store :settings, accessors: [:description, :template, :frequency, :priority]

    # validations
    validates :title, presence: true
    validates :slug, uniqueness: true

    # associations
    has_many :widgets
    has_many :assets, as: :assetable

    # behaviours
    has_ancestry
    acts_as_url :title, url_attribute: :slug, sync_url: true

    # callbacks
    after_initialize :initialize_defaults, :if => :new_record?

    # methods
    def to_param
      self.slug
    end

    def to_s
      self.title
    end

    def templates
      templates = []
      Dir.glob("#{PAGE_TEMPLATES_PATH}*.html.haml").each do |file|
        file = File.basename(file, '.html.haml')
        if file.start_with?('_')
        templates << file[1..-1]
        end
      end
      templates
    end

    private

    def initialize_defaults
      self.template = 'blank'
      self.frecuency = 'monthly'
      self.priority = 0.5
    end
  end
end
