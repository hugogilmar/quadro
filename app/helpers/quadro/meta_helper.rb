module Quadro
  module MetaHelper
    def meta_title title
    title.present? ? title : ENV['title']
  end

  def meta_description description
    description.present? ? description : ENV['description']
  end

  def meta_author author
    author.present? ? author : ENV['author']
  end
  end
end
