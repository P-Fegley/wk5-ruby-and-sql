# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table
# puts "There are #{Company.all.count} companies" # Company.all.count is the same as SELECT COUNT(*) FROM companies, just in ruby code

new_company = Company.new # creates a new potential row in the table (basically a hash)
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
# puts new_company.inspect # .inspect shows you the actual item. Without it, would just show you the memory location (not usefull)
new_company.save # actually inserts the row/hash into the database, completes the task

# puts "There are #{Company.all.count} companies" # Company.all.count is the same as SELECT COUNT(*) FROM companies, just in ruby code


new_company = Company.new # creates a new potential row in the table (basically a hash)
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
# puts new_company.inspect # .inspect shows you the actual item. Without it, would just show you the memory location (not usefull)
new_company.save # actually inserts the row/hash into the database, completes the task

# puts "There are #{Company.all.count} companies" # Company.all.count is the same as SELECT COUNT(*) FROM companies, just in ruby code


new_company = Company.new # creates a new potential row in the table (basically a hash)
new_company["name"] = "Google"
new_company["city"] = "Mountain View"
new_company["state"] = "CA"
# puts new_company.inspect # .inspect shows you the actual item. Without it, would just show you the memory location (not usefull)
new_company.save # actually inserts the row/hash into the database, completes the task

puts "There are #{Company.all.count} companies" # Company.all.count is the same as SELECT COUNT(*) FROM companies, just in ruby code


# 3. query companies table to find all row with California company
cali_companies = Company.where({ "state" => "CA" })
# puts cali_companies.inspect # note that this returns an array (i.e. a SQL table); see the brackets

puts "California companies: #{cali_companies.count}"


# 4. query companies table to find single row for Apple
# apple = Company.where({ "name" => "Apple" }) # note: this returns an array with the hash, not the single row
# apple = Company.where({ "name" => "Apple" })[0] # this would work, but it's awkward. Remember "array[index]" pulls something out of an array
apple = Company.find_by({ "name" => "Apple" }) # this is a more elegant version of the line right above. Usually you'd search by id, not name
puts apple.inspect


# 5. read a row's column value

# 6. update a row's column value

# 7. delete a row
