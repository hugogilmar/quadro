module Quadro
  class Page < ActiveRecord::Base
    # constants
    PAGE_TEMPLATES_PATH = "app/views/quadro/shared/templates/"

    # attributes
    attr_accessible :title, :description, :template
    store :settings, accessors: [:description, :template]

    # validations
    validates :title, presence: true
    validates :slug, uniqueness: true

    # associations
    has_many :widgets

    # behaviours
    has_ancestry
    acts_as_url :title, url_attribute: :slug

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
    end
  end
end
