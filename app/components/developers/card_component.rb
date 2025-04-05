module Developers
  class CardComponent < ApplicationComponent
    with_collection_parameter :developer

    delegate :featured?, :source_contributor?, to: :developer

    private attr_reader :developer, :highlight_featured, :current_user

    def initialize(developer:, highlight_featured: false, current_user: nil)
      @developer = developer
      @highlight_featured = highlight_featured
      @current_user = current_user
    end

    def hero
      developer.hero
    end

    def bio
      developer.bio
    end

    def highlight?
      !!highlight_featured && featured?
    end
  end
end
