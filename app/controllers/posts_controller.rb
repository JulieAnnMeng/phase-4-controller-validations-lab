class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :my_error_handler
  
  def show
    post = Post.find(params[:id])
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post 
  end

  

  # def update
  #   post = Post.find(params[:id])
  #     post.update(post_params)
  #   if post.valid?
  #     render json: post
  #   else
  #     render json: { errors: post.errors }, status: :unprocessable_entity
  #   end
  # end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def my_error_handler invalid
    render json: { errors: invalid.record.errors }, status: 422
  end

end
