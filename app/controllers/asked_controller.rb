class AskedController < ApplicationController
  def index
  end
  
  def write
    new_post = Post.new
    new_post.content = params[:content]
    @asked_content = params[:content]
    new_post.save
    redirect_to '/asked/list'
  end
  
  
  def list
    @every_post = Post.all
    @asked_content = params[:content]
    
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.replies.destroy
    @one_post.destroy
    redirect_to '/asked/list'
  end
  
  def update_view
    @subject = "질문 글 수정"
    @one_post = Post.find(params[:id])
  end
  
  def update
    @one_post = Post.find(params[:id])
    @one_post.content = params[:content]
    @one_post.save
    redirect_to '/asked/list'
  end
  
  def reply_write
    @one_reply = Reply.new
    @one_reply.post_id = params[:id_post]
    @one_reply.content = params[:content]
    @one_reply.save
    redirect_to '/asked/list'
  end
  
  
  def reply_destroy
    @one_post = Reply.find(params[:id])
    @one_post.destroy
    redirect_to '/asked/list'
  end
  
  def reply_update_view
    @subject = "댓글 수정"
    @one_post = Reply.find(params[:id])
  end
  
  def reply_update
    @one_post = Reply.find(params[:id])
    @one_post.content = params[:content]
    @one_post.save
    redirect_to '/asked/list'
  end
end
