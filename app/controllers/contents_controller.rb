class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all

    render body: @contents.first.json, content_type: 'application/json'
  end
end
