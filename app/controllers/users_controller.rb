class UsersController < ApplicationController
  def show
    @user = User.friendly.find params[:id].to_s.downcase
    @snippets = @user.snippets
  end

  def snippets
  end

  alias :pastes :snippets
end
