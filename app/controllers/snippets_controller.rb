class SnippetsController < ApplicationController
  def new
    store_current_location
    @snippet = signed_in? ? current_user.snippets.build : Snippet.new
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      @snippet.delay.pygmentation
      redirect_to user_snippet_path(current_user, @snippet), notice: 'New paste created successfully!'
    end
  end
  
  def show
    @snippet = Snippet.friendly.find params[:id]
    store_current_location
    respond_to do |format|
      format.html
      format.text { render text: @snippet.raw }
    end
  end

  def highlighted_code
    @snippet = Snippet.friendly.find params[:id]
    respond_to do |format|
      format.json do
        render json: @snippet.as_json(only: [:highlighted])
      end
    end
  end

  def raw
    @snippet = Snippet.friendly.find params[:id]
    respond_to do |format|
      format.text  { render text: @snippet.raw }
      format.html { redirect_to(raw_snippet_path(@snippet, format: :txt)) }
    end
  end

  def edit
    @snippet = Snippet.friendly.find params[:id]
  end

  def update
    @snippet = Snippet.friendly.find params[:id]

  end


  private
  def snippet_params
    params.require(:snippet).permit(:name, :language_id, :raw)
  end


end
