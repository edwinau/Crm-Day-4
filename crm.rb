# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

Contact.destroy_all

Contact.create(first_name: "Edwin", last_name: "Au", email: "edwinau@rogers.com", note: "xoxo")
Contact.create(first_name: "Greg", last_name: "Boone", email: "Boonev@rogers.com", note: "CEO")
Contact.create(first_name: "Mark", last_name: "Zuckerberg", email: "mark@facebook.com", note: "CEO")
Contact.create(first_name: 'Sergey', last_name: 'Brin', email:  "sergey@google.com", note: "Co-Founder")
Contact.create(first_name: "Steve", last_name: "Jobs", email: "steve@apple.com", note: "Visionary")


get "/" do
  @crm_app_name = "Edwin's CRM"
  @server_time = Time.now
  erb :index
end

get "/contacts" do
  erb :contacts
end

get "/new_contact" do
  erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

get "/search_contact" do
  contact = Contact.find(1000)
  erb :search_contact
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end





get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/delete' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end



put '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
