# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

new_activity = Activity.new
# new_activity["occurred_at"]
new_activity["notes"] = "quick checkin over facetime"
new_activity["salesperson_id"] = Salesperson.find_by({ "email" => "timjones@gmail.com" })["id"]
new_activity["contact_id"] = Contact.find_by({ "email" => "timcook@apple.com" })["id"]
new_activity.save

new_activity = Activity.new
# new_activity["occurred_at"]
new_activity["notes"] = "met at Cupertino"
new_activity["salesperson_id"] = Salesperson.find_by({ "email" => "timjones@gmail.com" })["id"]
new_activity["contact_id"] = Contact.find_by({ "email" => "timcook@apple.com" })["id"]
new_activity.save

new_activity = Activity.new
# new_activity["occurred_at"]
new_activity["notes"] = "met at Blue Origin HQ"
new_activity["salesperson_id"] = Salesperson.find_by({ "email" => "timjones@gmail.com" })["id"]
new_activity["contact_id"] = Contact.find_by({ "email" => "jeffyb@amazon.com" })["id"]
new_activity.save

# puts "Activities: #{Activity.all.count}"
# puts Activity.all.inspect


# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

timjones_id = Salesperson.find_by({ "email" => "timjones@gmail.com" })["id"]
timcook_id = Contact.find_by({ "email" => "timcook@apple.com" })["id"]

puts "Activities between Tim and Tim Cook:"
for item in Activity.where({ "salesperson_id" => timjones_id, "contact_id" => timcook_id })
    puts "#{item["notes"]}"
end

    # ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino


# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

puts "Tim Jones's Activities:"
for item in Activity.where({ "salesperson_id" => timjones_id })
    contact = Contact.find_by({ "id" => item["contact_id"] })
    firstname = contact["first_name"]
    lastname = contact["last_name"]
    puts "#{firstname} #{lastname} - #{item["notes"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ


# 3a. Can you include the contact's company?

puts "Tim Jones's Activities:"
for item in Activity.where({ "salesperson_id" => timjones_id })
    contact = Contact.find_by({ "id" => item["contact_id"] })

    company = Company.find_by({ "id" => contact["company_id"] })

    puts "#{contact["first_name"]} #{contact["last_name"]} (#{company["name"]}) - #{item["notes"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

for person in Salesperson.all
    number = Activity.where({ "salesperson_id" => person["id"] }).count
    puts "#{person["first_name"]} #{person["last_name"]}: #{number} activities"
end

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
