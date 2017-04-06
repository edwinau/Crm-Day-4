# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.classcontact
    @@contacts
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end


  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.find { |contact| contact.id == id }
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    if attribute == "first_name"
      self.first_name = new_value
    elsif attribute == "last_name"
      self.last_name = new_value
    elsif attribute == "email"
      self.email = new_value
    elsif attribute == "note"
      self.note = new_value
    end
  end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute_name, value)
    @@contacts.each do |person|
      if attribute_name == "first_name" && value == person.first_name
        return person
      elsif attribute_name == "last_name" && value == person.last_name
        return person
      elsif attribute_name == "email" && value == person.email
        return person
      elsif attribute_name == "note" && value == person.note
        return person
      end
    end
    return nil
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
      @@contacts.delete_if do |contact|
      contact.id == self.id
    end
  end
  
end

  # def self.delete_if(first_name)
  #     @@contacts.delete_if do |contact|
  #     contact.first_name == first_name
  #     end
  # end

  # Feel free to add other methods here, if you need them.

=begin
debug techniques
  -"puts statements
  -seacrh on google (error message)
  -read the error message (line number, stack trace)
  -ruby.docs
=end









# puts "please choose from the following"
# puts " - add"
# puts " - modify"
# puts " - delete"
# puts " - display_all"
# puts " - search by attribute"
# puts " - exit"
# gets.chomp!
