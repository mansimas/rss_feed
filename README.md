Rss Feed
============

Used: Twitter bootstrap design pattern

Instructions:


* Visit the website: http://mansimrssfeed.herokuapp.com/
* Input "Rss Url" 
* Input Category (any word in any title)
* Submit the form


Or

* Install Ruby on Rails on your mashine
* Download archived rss_test file
* Open console, move to directory where is the rss_test file
* run command "cd rss_test"
* run command "rails console"
* if, for example, feed_url is "http://www.nfq.lt/rss" and category is "studentai"
* run command "Feed.update_from_feed("http://www.nfq.lt/rss", "studentai")
* Database will be created and available on localhost:3000