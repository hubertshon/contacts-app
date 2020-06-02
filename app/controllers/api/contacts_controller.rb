class Api::ContactsController < ApplicationController

  def index
    @contact = Contact.all
    render "index.json.jb"
  end

  def show
    @contact = Contact.find(params[:id])
    render "show.json.jb"
  end

  def create
    @contact = Contact.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    @contact.save
    render "show.json.jb"
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.name = params[:name] || @contact.name
    @contact.email = params[:email] || @contact.email
    @contact.phone = params[:phone] || @contact.phone

    @contact.save
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: { message: "Item destroyed" }
  end

end
