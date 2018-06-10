class GamesController < ApplicationController
  def index
    if Game.where("game_date > ?", Date.today - 2.day).length == 0
      generate_games
    end

    games = Game.where("game_date > ?", Date.today - 2.day)

    @current_game = games.first
    @upcoming_games = games.drop(1)
    @people = Person.all

    render("games/index.html.erb")
  end

  def show
    @game = Game.find(params[:id])

    render("games/show.html.erb")
  end

  def new
    @game = Game.new

    render("games/new.html.erb")
  end

  def create
    @game = Game.new

    @game.game_date = params[:game_date]
    @game.cancelled = params[:cancelled]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/#{@game.id}", :notice => "Game created successfully.")
    else
      render("games/new.html.erb")
    end
  end

  def edit
    @game = Game.find(params[:id])

    render("games/edit.html.erb")
  end

  def update
    @game = Game.find(params[:id])

    @game.game_date = params[:game_date]
    @game.cancelled = params[:cancelled]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/#{@game.id}", :notice => "Game updated successfully.")
    else
      render("games/edit.html.erb")
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    if URI(request.referer).path == "/games/#{@game.id}"
      redirect_to("/", :notice => "Game deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Game deleted.")
    end
  end

  private

  def generate_games
    start_date = Date.today
    end_date = Date.today + 3.months
    hash_of_dates = (start_date..end_date).group_by(&:wday)
    array_of_sundays = hash_of_dates[0]

    array_of_sundays.each do |sunday_date|
      Game.create(
        cancelled: false,
        game_date: sunday_date
      )
    end
  end
end
