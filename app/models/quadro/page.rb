module Quadro
  class Page < ActiveRecord::Base
    # constants
    PAGE_TEMPLATES_PATH = 'app/views/quadro/shared/templates/'
    SITEMAP_FREQUENCY = %w(always hourly daily weekly monthly yearly never).freeze
    SITEMAP_PRIORITY = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0].freeze

    # attributes
    attr_accessible :title, :description, :author, :template, :frequency, :priority, :cover_attributes
    store :settings, accessors: [:description, :author, :template, :frequency, :priority]

    # validations
    validates :title, presence: true, length: { maximum: 60 }
    validates :slug, uniqueness: true
    validates :description, length: { maximum: 160 }

    # associations
    has_many :widgets, dependent: :destroy
    has_many :assets, as: :assetable, dependent: :destroy
    has_many :images, as: :assetable, class_name: Quadro::Asset::Image
    has_one :cover, as: :assetable, class_name: Quadro::Asset::Cover

    # nested attributes
    accepts_nested_attributes_for :cover, allow_destroy: false

    # behaviours
    has_ancestry orphan_strategy: :destroy
    acts_as_url :title, url_attribute: :slug, sync_url: true

    # callbacks
    after_initialize :initialize_defaults, if: :new_record?
    after_save :ensure_cover

    # methods
    def to_param
      slug
    end

    def to_s
      title
    end

    def templates
      templates = []
      Dir.glob("#{PAGE_TEMPLATES_PATH}*.html.haml").each do |file|
        file = File.basename(file, '.html.haml')
        templates << file[1..-1] if file.start_with?('_')
      end
      templates
    end

    def find_asset(asset_id)
      new_asset = assets.find(asset_id) rescue nil
      new_asset.becomes(new_asset.type.constantize) unless new_asset.nil?
      new_asset
    end

    def ensure_cover
      generate_cover if self.cover.nil?
    end

    private

    def initialize_defaults
      self.template = ENV['template'] if self.template.blank?
      self.frequency = ENV['frequency'] if self.frequency.blank?
      self.priority = ENV['priority'] if self.priority.blank?
      self.author = ENV['author'] if self.author.blank?
    end

    def generate_cover
      self.build_cover
      self.cover.save
    end

    class << self
      def short_name
        'page'
      end
    end
  end
end
