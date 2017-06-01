class HaksicksController < ApplicationController
 require 'nokogiri'
 require 'open-uri'
 
 def index
	 @mon = Haksick.find_by_day("월")
	 @tue = Haksick.find_by_day("화")
	 @wed = Haksick.find_by_day("수")
	 @thu = Haksick.find_by_day("목")
	 @fri = Haksick.find_by_day("금")
	 @sat = Haksick.find_by_day("토")
 end

 def get_bob
	 doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))
	 
	 for j in (2..7)
	 i = 2*j - 1
	 bob = Haksick.new
		 if i == 13 
			day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
			bob.day = day
			date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
			bob.date = date
			morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p.menulist//span")[0].inner_text.split("-")[1]
			bob.morning_a = morning_a
			bob.morning_b = "none"
			lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(4)").inner_text.split("-")[1]
			bob.lunch = lunch
			dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(5)").inner_text.split("-")[1]
			bob.dinner = dinner
		 elsif i == 11
			day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
			bob.day = day
			date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
			bob.date = date
			morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p.menulist//span")[0].inner_text.split("-")[1]
			bob.morning_a = morning_a
			bob.morning_b = "none"
			lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(4)").inner_text.split("-")[1]
			bob.lunch = lunch
			dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(5)").inner_text.split("-")[1]
			bob.dinner = dinner
		 elsif i == 3
		 	day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
			bob.day = day
			date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
			bob.date = date
			morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//li//p.menulist")[0].inner_text.split("-")[1]
			bob.morning_a = morning_a
			morning_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
			bob.morning_b = morning_b
			lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
			bob.lunch = lunch
			dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(6)").inner_text.split("-")[1]
			bob.dinner = dinner
		 else
			day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
			bob.day = day
			date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
			bob.date = date
			morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p")[0].inner_text.split("-")[1]
			bob.morning_a = morning_a
			morning_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
			bob.morning_b = morning_b
			lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
			bob.lunch = lunch
			dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(6)").inner_text.split("-")[1]
			bob.dinner = dinner
		end
	 bob.save
	 end
 redirect_to '/'
 end

end


