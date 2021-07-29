ActiveAdmin.register Ticket do

  
  # menu parent: "Book your ticket"

  

  permit_params :category, :price, :booked_at, :sport_id

  scope :all, default: true
  scope :book
  scope :cancel

  #filter customization
  filter :sport, as: :check_boxes
  filter :category, as: :select, collection: ->{ Ticket.distinct.pluck(:category) }
  filter :price
  filter :booked_at

  #form customization
  form decorate: true do |f|
    tabs do
      tab 'Basic' do
        inputs "Details" do
          input :sport
          input :category
          input :price
        end
      end
      panel 'Markup' do
        "The following can be used in the content below..."
      end
    end
    para "Press cancel to return to the list without saving."
    actions 
  end

  
  #index table customization
  index do
    column :sport
    column :category
    column :booked_at
    column "Price", sortable: :price do |ticket|
      number_to_currency ticket.price
    end
    actions
  end

  

  #action button
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

  sidebar :help, partial: 'custom'

end
