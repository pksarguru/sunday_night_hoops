class PeopleController < ApplicationController
  def index
    @people = Person.all

    render("people/index.html.erb")
  end

  def show
    @person = Person.find(params[:id])

    render("people/show.html.erb")
  end

  def new
    @person = Person.new

    render("people/new.html.erb")
  end

  def create
    @person = Person.new

    @person.email = params[:email]
    @person.name = params[:name]

    save_status = @person.save

    if save_status == true
      redirect_to("/", :notice => "Person created successfully.")
    else
      render("people/new.html.erb")
    end
  end

  def edit
    @person = Person.find(params[:id])

    render("people/edit.html.erb")
  end

  def update
    @person = Person.find(params[:id])

    @person.email = params[:email]

    save_status = @person.save

    if save_status == true
      redirect_to("/people/#{@person.id}", :notice => "Person updated successfully.")
    else
      render("people/edit.html.erb")
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    if URI(request.referer).path == "/people/#{@person.id}"
      redirect_to("/", :notice => "Person deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Person deleted.")
    end
  end
end
