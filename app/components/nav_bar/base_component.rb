module NavBar
  class BaseComponent < ApplicationComponent
    private attr_reader :user

    def initialize(user)
      @user = user
    end

    def component
      if user.present?
        NavBar::UserComponent.new(user, links:)
      else
        NavBar::GuestComponent.new(links:)
      end
    end

    private

    def links
      links = []
      links << Link.new(t(".home"), root_path) if helpers.turbo_native_app?
      links << Link.new(t(".developers"), developers_path)
      links << Link.new(t(".favorite_developers"), favorite_developers_developers_path) if business?
      links << Link.new(t(".pricing"), pricing_path)
      links
    end

    def business?
      user&.business&.persisted?
    end
  end
end
