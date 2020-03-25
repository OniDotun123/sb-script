require 'httparty'

base_uri = "https://backend.staffbase.com/api/"
api_key = "Basic NWU3NTQ1NjU1ZjZmMDQwZGRjZmQ0MWZmOjRBbFJFdk1ISDdmQlMkRkZ1LWtjXU5lVDsmeFpIRmZJeWxNQ0p+LXp1eX4tcmZ3S20xdEgtJnlhRyRuW095cWE="


response = HTTParty.post("https://developers.staffbase.com/user/")