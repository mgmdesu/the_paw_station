class Public::HomesController < ApplicationController
  
  #新着3件を表示
  def top
    @new_3_walks = Walk.order('id desc').limit(3)
  end

  def about
  end
end
