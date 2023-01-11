class Public::SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    @walks = Walk.where([ "title LIKE? OR opinion LIKE? OR dogrun_name LIKE?", "%#{@word}%", "%#{@word}%", "%#{@word}%" ])
  end 
end
