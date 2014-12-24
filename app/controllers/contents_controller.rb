class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all

    render json: @contents
  end
end
