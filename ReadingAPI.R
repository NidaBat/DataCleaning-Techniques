# Creating an application
# https://apps.twitter.com/
# accessing twitter from R
myapp = oauth_app("twitter",
                  key="hITT6Su9AdQS6x7yxa2L4RVxg",secret="o2OJW015jkJytEnGGWX4ekYjhFBkrAqMZ5Vygm76CAfHtJDr6W")
sig = sign_oauth1.0(myapp,
                    token = "3440525420-NcmWj1tpU4L0fIy5EfHAgkecwP9kUVLnDEUzMEU",
                    token_secret = "TCdte2SImDtEIeJ0gV1yejFgVP1VDE5b52jhnkBWKsw35")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object

library(httr)
install.packages("jsonlite")
library(jsonlite)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]
??toJASON

#In general look at the documentation

##httr allows GET, POST, PUT, DELETE requests if you are authorized
##You can authenticate with a user name or a password
##Most modern APIs use something like oauth
##httr works well with Facebook, Google, Twitter, Githb, etc.