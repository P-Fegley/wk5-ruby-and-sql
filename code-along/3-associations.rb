# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database
# puts "Contacts: #{Contact.all.count}"

apple = Company.find_by({"name" => "Apple"})
# puts apple["id"].inspect

new_contact = Contact.new
new_contact["first_name"] = "Tim"
new_contact["last_name"] = "Cook"
new_contact["email"] = "timcook@apple.com"
new_contact["company_id"] = apple["id"]
new_contact.save

# puts new_contact.inspect

# puts "Contacts: #{Contact.all.count}"


# 1. insert new rows in the contacts table with relationship to a company

new_contact = Contact.new
new_contact["first_name"] = "Craig"
new_contact["last_name"] = "Federeghi"
new_contact["email"] = "craig@apple.com"
new_contact["company_id"] = apple["id"]
new_contact.save

amazon = Company.find_by({ "name" => "Amazon" })
new_contact = Contact.new
new_contact["first_name"] = "Jeff"
new_contact["last_name"] = "Bezos"
new_contact["email"] = "jeffyb@amazon.com"
new_contact["company_id"] = amazon["id"]
new_contact.save

# 2. How many contacts work at Apple?
# apple_contacts = Company.where({ "company_id" => apple["id"] })
# puts "Apple contacts: #{apple_contacts.count}"
puts "Apple contacts: #{Contact.where({ "company_id" => apple["id"] }).count }"

# 3. What is the full name of each contact who works at Apple?

for person in Contact.where({ "company_id" => apple["id"] })
    puts "#{person["first_name"]} #{person["last_name"]}"
end
# Should maybe break it up into variables
# apple_contacts = Contact.where({ "company_id" => apple["id"] })
# for person in apple_contacts
#     puts "#{person["first_name"]} #{person["last_name"]}"
# end