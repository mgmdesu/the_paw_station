class Public::HomesController < ApplicationController
  def top
    @new_3_walks = Walk.order('id desc').limit(3)
  end

  def about
  end
end
