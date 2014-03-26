class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      @snippet.delay.pygmentation
      redirect_to @snippet
    end
  end
  
  def show
    @snippet = Snippet.find params[:id]
  end


  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]

  end

  private
  def snippet_params
    params.require(:snippet).permit(:name, :language, :raw)
  end


end
