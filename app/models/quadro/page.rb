module Quadro
  class Page < ActiveRecord::Base
    # constants
    PAGE_TEMPLATES_PATH = "app/views/quadro/shared/templates/"
    SITEMAP_FREQUENCY = ["always", "hourly", "daily", "weekly", "monthly", "yearly", "never"]
    SITEMAP_PRIORITY = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

    # attributes
    attr_accessible :title, :description, :author, :template, :frequency, :priority, :cover_attributes
    store :settings, accessors: [:description, :author, :template, :frequency, :priority]
    accepts_nested_attributes_for :cover

    # validations
    validates :title, presence: true
    validates :slug, uniqueness: true

    # associations
    has_many :widgets
    has_many :assets, as: :assetable
    has_many :images, as: :assetable, class_name: Quadro::Asset::Image
    has_one :cover, as: :assetable, class_name: Quadro::Asset::Cover

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
      self.frequency = 'monthly'
      self.priority = 0.5
      self.author = ENV['author']
    end
  end
end
