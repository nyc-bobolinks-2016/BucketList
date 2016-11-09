class ListItemsController < ApplicationController
  before_action :require_login
  def update
    @item = ListItem.find_by(id: params[:id])
    @item.update(checked: params[:checked])
  end
end
