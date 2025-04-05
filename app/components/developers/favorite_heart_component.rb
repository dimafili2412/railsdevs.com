module Developers
  class FavoriteHeartComponent < ApplicationComponent
    include Rails.application.routes.url_helpers

    def initialize(developer:, business:)
      @developer = developer
      @business = business
    end

    def favorited?
      @business && Favorite.favorited?(@business, @developer)
    end

    def heart_icon
      favorited? ? "icons/solid/red_heart.svg" : "icons/outline/red_heart.svg"
    end

    def heart_classes
      "h-6 w-6 cursor-pointer"
    end

    def toggle_path
      toggle_developer_favorite_path(@developer)
    end
  end
end
