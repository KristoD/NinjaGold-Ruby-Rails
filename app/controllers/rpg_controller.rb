class RpgController < ApplicationController
  @@time = Time.now
  def index
    session[:gold]
    session[:logs]
    render "index"
  end

  def farm
    num = rand(10..20)
    session[:gold] += num
    message = "Earned #{num} gold from the farm! (#{@@time})"
    session[:logs].push([message, "green"])
    redirect_to "/"
  end

  def cave
    num = rand(5..10)
    session[:gold] += num
    message = "Earned #{num} gold from the cave! (#{@@time})"
    session[:logs].push([message, "green"])
    redirect_to "/"
  end

  def casino
    num = rand(-50..50)
    session[:gold] += num
    if num > 0
      message = "Earned #{num} gold from the casino! (#{@@time})"
      session[:logs].push([message, "green"])
    else
      message = "Lost #{num} gold from the casino! (#{@@time})"
      session[:logs].push([message, "red"])
    end
    redirect_to "/"
  end

  def house
    num = rand(2..5)
    session[:gold] += num
    message = "Earned #{num} gold from the house! (#{@@time})"
    session[:logs].push([message, "green"])
    redirect_to "/"
  end
end
