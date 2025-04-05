class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_business!

  def toggle
    @developer = Developer.find_by_hashid!(params[:developer_id])
    if Favorite.favorited?(current_user.business, @developer)
      Favorite.unfavorite!(current_user.business, @developer)
    else
      Favorite.favorite!(current_user.business, @developer)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: developers_path }
    end
  end

  private

  def require_business!
    redirect_to new_business_path unless current_user.business.present?
  end
end
