class ListItemsController < ApplicationController
  def update
    @item = ListItem.find_by(id: params[:id])
    @item.update(checked: params[:checked])
  end
end
