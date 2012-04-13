class CommentsController < ApplicationController
  respond_to :json, :html
  before_filter :find_level
  before_filter :find_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_comments

  def index
    @comments = Comment.all

    respond_with @comments
  end

  def new
    @comment = Comment.new

    respond_with @comment
  end

  def create
    @comment = Comment.new(params[:comment])

    @comment.save
    respond_with [@level, @comment], location: [@level, Comment]
  end

  def destroy
    @comment.destroy

    respond_with @comment
  end

  private

  def find_level
    @level = Level.find params[:level_id]
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def authorize_comments
    authorize! :create_comment, @level
  end
end
