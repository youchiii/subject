class CommentsController < ApplicationController
  def create
    @list = List.find(params[:])
end
