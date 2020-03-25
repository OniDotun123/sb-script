require 'httparty'

base_uri = "https://backend.staffbase.com/api/"
api_key = "Basic NWU3NTQ1NjU1ZjZmMDQwZGRjZmQ0MWZmOjRBbFJFdk1ISDdmQlMkRkZ1LWtjXU5lVDsmeFpIRmZJeWxNQ0p+LXp1eX4tcmZ3S20xdEgtJnlhRyRuW095cWE="
file_location = "./profile_pic.JPG"
user_id = "5e751d8f348fff7d5bc4d952"

response = HTTParty.post("#{base_uri}users/#{user_id}",
    headers: {
        "Authorization" => "#{api_key}",
        "Content-Type" => "application/json"
    }, 
    body:{
        "contents": {
            "en_US": {
                "avatar": "#{file_location}",
            }
        }
    }.to_json     
)

puts response.code