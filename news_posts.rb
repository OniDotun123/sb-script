#rss gem to parse the RSS feed. 
#httparty gem to send post request to Staffbase API 

require 'rss'
require 'httparty'


class Post
    include HTTParty, RSS
    attr_accessor :title, :description, :news_url
    attr_reader :pubDate, :channel_id
    @@base_uri = "https://backend.staffbase.com/api/"
    @@api_key = "Basic NWU3NTQ1NjU1ZjZmMDQwZGRjZmQ0MWZmOjRBbFJFdk1ISDdmQlMkRkZ1LWtjXU5lVDsmeFpIRmZJeWxNQ0p+LXp1eX4tcmZ3S20xdEgtJnlhRyRuW095cWE="

    #initialize method that is instantiated when you create a new instance. It requires a url for the rss feed and the channel ID  
    def initialize(news_url, channel_id)
      @news_url = news_url
      @channel_id = channel_id  
    end


    #The post_data method imports the RSS feed using the RSS Parser and converts it into an array or objects. 
    #I parse through each post and make a post request to the Staffbase API to send the content, title and Image. 

    def post_data
        rss = RSS::Parser.parse(@news_url, false)
        rss.items.each do |item|
            response = HTTParty.post("#{@@base_uri}channels/#{@channel_id}/posts",
                headers: {
                    "Authorization" => @@api_key,
                    "Content-Type" => "application/json"
                }, 
                body:{
                    "contents": {
                        "en_US": {
                            "content": "#{item.description}",
                            "teaser": "New Article!!!",
                            "title": "#{item.title}", 
                            "image": "#{item.enclosure.url}"
                        }
                    }
                }.to_json     
            )      
        end
    end 


end

#Instantiating a new instance of post. 
x = Post.new("https://www.smithsonianmag.com/rss/arts-culture/", "5e751d4aae40f36dd45509ae")

#calling the method in the class that will send the content and image of the news post to the channel. 
x.post_data
               
#Future updates would include creating a method that will check for a match for the channel name. This will address the issue of having to instantiate using an ID. The new parameters would be a channel name instead. Since we're using OOP design, it wouldn't take too much of an effort to make these changes. 
            
         


















