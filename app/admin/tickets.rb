ActiveAdmin.register Ticket do

  
  permit_params :category, :price, :booked_at, :sport_id

  scope :all
  scope :book
  scope :cancel

  form do |f|
    inputs "Details" do
      input :sport
      input :category
      input :price
    end
    actions 
  end
  
  action_item :book, only: :show do
    link_to "Book ticket", book_admin_ticket_path(ticket), method: :put if !ticket.booked_at?
  end

  action_item :book, only: :show do
    link_to "Cancel ticket", cancel_admin_ticket_path(ticket), method: :put if ticket.booked_at?
  end

  member_action :book, method: :put do
    ticket = Ticket.find(params[:id])
    ticket.update(booked_at: Time.zone.now)
    redirect_to admin_sport_path(ticket)
  end
  
  member_action :cancel, method: :put do
    ticket = Ticket.find(params[:id])
    ticket.update(booked_at: nil)
    redirect_to admin_sport_path(ticket)
  end

end
