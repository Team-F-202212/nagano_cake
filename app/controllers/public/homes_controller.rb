class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: 'true').order('id DESC').limit(4)
    @genres = Genre.all

  end
end
