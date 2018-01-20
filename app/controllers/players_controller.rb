class PlayersController < ApplicationController
  def new
    @player = Player.new

    render("players/new.html.erb")
  end

  def create
    @player = Player.new

    @player.person_id = params[:person_id]
    @player.game_id = params[:game_id]
    @player.guests = params[:guests]

    save_status = @player.save

    if save_status == true
      redirect_to("/", :notice => "Added to game successfully.")
    else
      render("players/new.html.erb")
    end
  end

  def edit
    @player = Player.find(params[:id])

    render("players/edit.html.erb")
  end

  def update
    @player = Player.find(params[:id])

    @player.person_id = params[:person_id]
    @player.game_id = params[:game_id]
    @player.guests = params[:guests]

    save_status = @player.save

    if save_status == true
      redirect_to("/players/#{@player.id}", :notice => "Player updated successfully.")
    else
      render("players/edit.html.erb")
    end
  end

  def destroy
    @player = Player.find(params[:id])

    @player.destroy

    if URI(request.referer).path == "/players/#{@player.id}"
      redirect_to("/", :notice => "Player deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Player deleted.")
    end
  end
end
