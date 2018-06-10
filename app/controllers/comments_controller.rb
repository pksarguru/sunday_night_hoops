class CommentsController < ApplicationController
  def create
    comment = Comment.new

    comment.game_id = params[:game_id]
    comment.person_id = params[:person_id]
    comment.text = params[:text]

    save_status = comment.save

    if save_status == true
      redirect_to("/", :notice => "Comment added successfully.")
    else
      render("comments/new.html.erb")
    end
  end
end
