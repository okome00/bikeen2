class PostCommentsController < ApplicationController
  before_action :authenticate_user! ## ログイン権限

  def create ## コメント投稿アクション
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    @post = comment.post
    comment.save
    @post.create_notification_post_comment!(current_user, comment.id)
    redirect_to post_path(post)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private ## コメント投稿データストロングパラメータ

  def post_comment_params
  params.require(:post_comment).permit(:content)
  end

end
