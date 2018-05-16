class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def toggle_bookmark
    bookmark = current_user.bookmarks.find_by(post_id: params[:post])
    if bookmark.blank?
      current_user.bookmarks.create(post_id: params[:post])
    else
      bookmark.destroy
    end
    redirect_to '/'

  end

end

