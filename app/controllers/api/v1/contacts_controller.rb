class Api::V1::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    render json: @contacts, status: :ok
  end

  def show
    @contact = Contact.where(id: params[:id]).first

    if @contact
      render json: @contact, status: :ok
    else
      render json: {}, status: :not_found
    end
  end

  def create
    @contact = Contact.create(contact_params)

    @contact.save
    render json: @contact, status: :created
  end

  def destroy
    @contact = Contact.where(id: params[:id]).first

    if not @contact
      head(:not_found)
    elsif @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
