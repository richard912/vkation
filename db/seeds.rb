# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seeds for stay types
stay_types =  ['Home Stay', 'Resort']
puts 'Stay Types'
stay_types.each do |stay|
  StayType.where( :name => stay ).first_or_create
  puts 'stay: ' , stay
end
# Seeds for status's
statuses =  ['Confirmed', 'Cancelled', 'Pending']
puts 'Status'
statuses.each do |status|
  Status.where( :name => status ).first_or_create
  puts 'Status: ' , status
end
# Seeds for range 
z = 0

if Budget.last.nil?
	10.times do 
		Budget.create(:start_range => z, :end_range => z+10000)
		z = z+10000
	end
end
# Transport Seeds
if Transport.last.nil?
	Transport.create!(:name=> "MINI CAB", :transport_type => "AC", :price => '1000', :hours => '6')
	Transport.create!(:name=> "SEDAN", :transport_type => "AC", :price => '2000', :hours => '6')
	Transport.create!(:name=> "7 SEATER", :transport_type => "AC", :price => '4000', :hours => '6')
	Transport.create!(:name=> "MINI BUS", :transport_type => "Non-AC", :price => '6000', :hours => '6')
end

# Category Data
if Category.last.nil?
	cat = Category.create!(:name => 'Ecotourism', :image_link => '/assets/Ecotourism.jpg', :amenities => '')
		
		cat.activities.create!(:name => 'Ethinic Villages tours', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'Handicrafts', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Camping', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Birding', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Cycling', :image_link => '/assets/Others.jpg')
	
	cat = Category.create!(:name => 'Wellness & Care', :image_link => '/assets/Wellness.jpg', :amenities => 'YOGA,GYM,Ayurveda Centre,Swimming Pool')
		
		cat.activities.create!(:name => 'Fitness Programs', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'SPA & Massage Programs', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Yoga Programs', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Ayurvedic Programs', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Healing Programs', :image_link => '/assets/Others.jpg')
	
	cat = Category.create!(:name => 'Heritage & Sprituality', :image_link => '/assets/Heritage.jpg', :amenities => 'YOGA, Ayurveda Centre')
		
		cat.activities.create!(:name => 'Pilgrimage Yatra', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'Heritage Sightseen', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Meditation Programs', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Cultural Activities', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Ayurvedic Programs', :image_link => '/assets/Others.jpg')
	
	cat = Category.create!(:name => 'Family & Kids', :image_link => '/assets/Family.jpg', :amenities => 'Kids Play Area,Indoor Games,Pets Allowed,Shopping,Safety Card')

		cat.activities.create!(:name => 'Day Outs', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'Play Ground', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Amuesment Park', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Camping', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Cycling', :image_link => '/assets/Others.jpg')
	
	cat = Category.create!(:name => 'Adventure & Explore', :image_link => '/assets/Adventure.jpg', :amenities => 'Outdoor Games,24 Hour Check - In,Swimming Pool')
	
		cat.activities.create!(:name => 'Trekking', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'Rafting', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Hiking', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Kayaking', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Rock Climbing ', :image_link => '/assets/Others.jpg')
	
	cat = Category.create!(:name => 'Romantic Holiday', :image_link => '/assets/Romantic.jpg', :amenities => 'Lounge,Candle Light Dinner,Bar & Restaurant,Swimming Pool')

		cat.activities.create!(:name => 'Romantic Dining', :image_link => '/assets/Trekking.jpg')
		cat.activities.create!(:name => 'Photography', :image_link => '/assets/Safari.jpg')
		cat.activities.create!(:name => 'Camping', :image_link => '/assets/Camping.jpg')
		cat.activities.create!(:name => 'Couple Day Outing', :image_link => '/assets/Raftings.jpg')
		cat.activities.create!(:name => 'Cycling', :image_link => '/assets/Others.jpg')
end
# Seeds for Places
if Place.last.nil?
  	place = Place.create!( :name => 'Croog' )
  		attraction = place.attractions.create!(
  			:name => 'Coorg Whitewater Rafting',
  			:about => "Rafting in Coorg, through the Barapole River's roaring currents is indeed an experience worth cherishing! The activity begins with your arrival at Barapole. You can participate in this activity of 3 hours anytime between 09:00AM to 03:00PM. Make sure you attend the next session on safety tips to enjoy the best of rafting Coorg!",
  			:activity_type => 'Rafting',
			:latitude => '12.028271',
			:longitude => '75.929569',
			:duration => '1 Hours',
			:price => '1250',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "Pair of dry clothes, Cap, Sunscreen",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4', 
			:image_link => '/assets/River-white-water-rafting.jpg',
			:inclusions => "Trained instructors charges, Rafting in calm water, Safety equipments Activity cost." )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Rohit Dahiya', 
 				:reviews => "My first river rafting experience and Coorg white water rafting simply owned me. Coorg Water Sports were the organizers and it costed around Rs. 800. The total length of the rafting was roughly 4kms during which you encounter 6 rapids. Non swimmer and new to water rafting i was a bit skeptical and to be honest a bit scared too But the entire experience was thoroughly enjoyable.",
 				:rating => '4.2' )


  		attraction = place.attractions.create!(
  			:name => 'Abbey Falls',
  			:about => "Nestled near Madikeri, Abbey falls is one of the most amazing attractions in the Coorg. . The picturesque view of the fall will surely take your breath away and also provide you with quite a few Kodak moments. The waterfall comes down from a height of 70 feet and provides a superb vista. You will also find a hanging bridge across the gorge from which an exceptional view of this waterfall is a sight to remember.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.45515',
			:longitude => '75.719727',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.9', 
			:image_link => '/assets/925754087s.jpg',
			:inclusions => '' )
  			attraction.attraction_reviews.create!(
 				:customer_name => 'Sanoop Sanjan', 
 				:reviews =>"A beautiful waterfalls to be enjoyed with lots of smiles around u. The cool wind and water takes u to your childhood days never miss this place wherever you are just visit it once and u will visit it a second time",
 				:rating => '4' )

  			attraction = place.attractions.create!(
  			:name => 'Madikeri Fort',
  			:about => "Amid those thick forests, scenic gushing waterfalls and miles of verdant coffee plantations, history holds a deep rooted relationship with Coorg in Karnataka. And it is Madikeri, a hill station and headquarters of Coorg district that synchronizes well with its long gone historical royalty. Madikeri Fort stands as a silent spectator of events of victory and defeat from the time of Muddu Raja during 17th century. It is one of those preserved remnants of the bygone era that has not only stood the test of time, but also underwent architectural changes with passing time.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.420946',
			:longitude => '75.738594',
			:duration => '3 hours ',
			:price => '0',
			:visit_time => 'Tue - Sun 10:00 AM - 5:30 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '3.2', 
			:our_rating => '3.2', 
			:image_link => '/assets/Madikeri-Fort-INR.jpg',
			:inclusions => '' )
			attraction.attraction_reviews.create!(
 				:customer_name => 'Raj Sharma', 
 				:reviews =>"Madikeri Fort is located in the heart of Madikeri and it's ramparts provide a vantage point to view te layout of the city. The museum in the church inside the fort is also an interesting place to visit.",
 				:rating => '3' )
	


  			attraction = place.attractions.create!(
  			:name => 'Dubare Elephant Camp',
  			:about => 'The most famous of all Madikeri attractions is Dubare Elephant Camp which is known for the training of elephants. The nearby forests of Dubare give you an opportunity to explore the vivid wildlife of these forests. Many wild animals like Asian elephants, sambhar and cheetal deer can be seen while roaming in these forests. Tourists can also enjoy elephant rides and training sessions of elephants in this park. Wildlife safari gives you a chance to see other animals too like crocodiles, peacocks and gaurs. You can also experience the wilderness of the surroundings by staying in the lodges and resorts which are provided by the park authority. All these things make this place one of the most visited attractions in Madikeri.',
  			:activity_type => '',
			:latitude => 'Sightseeing',
			:longitude => '12.368509',
			:duration => '75.904923',
			:price => '0',
			:visit_time => '', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4', 
			:our_rating => '4.1', 
			:image_link => '/assets/elephant-camp.jpg',
			:inclusions => '' )
			attraction.attraction_reviews.create!(
 				:customer_name => 'Jiri Savora', 
 				:reviews =>"Very nice experience riding elephant. As everywhere mess, garbage. Highly recommended to cross the water by foot - it is fun and refreshing. Way back use the boat. Elephant riding is till 13:30 only officials, but they extend for extra hour and half.",
 				:rating => '4.2' )
	

  		attraction = place.attractions.create!(
  			:name => 'Omkareshwara Temple',
  			:about => "The Omkareshwar Temple is a symbol of belief, devotion and faith. Legend has it that the then ruler of Kodagu, Lingarajendra II had murdered an innocnet Brahmin, the reasons for which are not clearly known. The Brahmin had turned into a spirit to avenge his death and the king to save himself from the clutches of the spirit had got a special lingam installed at the spot of the crime which was brought all the way from Kashi. The temple was built later in 1820.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.420559',
			:longitude => '75.741264',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:30 AM - 12:00 Noon; 5:00 PM -  8:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.3', 
			:image_link => '/assets/Omkareshwara-Temple-Coorg.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Pritak Sok', 
 				:reviews =>"Very peaceful place to go to relax.Sit back and enjoy with no disturbance.No cellular network available .So, ultimate place to find peace of mind.",
 				:rating => '4.5' )
	

  		attraction = place.attractions.create!(
  			:name => 'Mallalli Falls',
  			:about => "Mallalli Falls lies in the foot of Pushpagiri Hill Ranges, where Kumaradhara river takes a plunge over 200 feet . The falls is situated in Bettadahalli Gram Panchayat in Somwarpet Taluk of Coorg.mallalli water falls, Mallalli Falls is one of the most beautiful water falls in Coorg.  One would not disagree if someone says Malalli Falls better than Abbey Falls. This River flows down to Mangalore through Kukke Subrahmanya. Mallalli falls is around 25 kilometers from Somvarpet or 42 kms from Kushalnagar. The water fall is only accessible by foot as the roads are very narrow and rugged.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.681443',
			:longitude => '75.723867',
			:duration => '4 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '5', 
			:our_rating => '4.4', 
			:image_link => '/assets/mallalli_falls_4.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Varun M Rao', 
 				:reviews =>"It's a great place to visit. You can enjoy the waterfall by watching its beautiful course through the rocks, but you can't play there. The network to reach isn't good. You have to get a jeep from Somwarpet to go there. And you won't get any buses there, so you gotta talk to round way trip. You will also get auto rickshaws. Even if you have own vehicle you should walk at the least 2 kms to go to the falls, but it's worth it",
 				:rating => '4.2' )



  		attraction = place.attractions.create!(
  			:name => 'Pushpagiri wildlife sanctuary',
  			:about => 'Pushpagiri Wildlife Sanctuary is located in Somwarpet taluk of Kodagu district in southern Karnataka. It is noted as one of the important bird areas of the world and home to rare and endangered bird life. It is spread over 102 kms. The sanctuary adjoins Bisle reserve forest to the north and Kukke Subramanya forest range to the west',
  			:activity_type => 'Adventure',
			:latitude => '12.657885',
			:longitude => '75.686752',
			:duration => '5 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 6:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.3', 
			:our_rating => '4.3', 
			:image_link => '/assets/pushpagiri_wildlife_santuary_2.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Ravi Kumar', 
 				:reviews =>"A 30km drive from Somvarpet gets you to the Pushpagiri temple on the peak. The Shiva temple is set in the backdrop of the hill range and very tranquail. The drive is pleasant enough, dont know about any activities like safari within this wildlife sanctuary",
 				:rating => '4.3' )

  			

  		attraction = place.attractions.create!(
  			:name => 'Iruppu Falls',
  			:about => "Iruppu waterfall is one of Coorgs major tourist attractions. Iruppu is a sacred place and is located in south Coorg on the Brahmagiri range of hills. River Lakshmana-tirtha flows nearby. According to legends Rama and Lakshmana, passed this way in search of Sita. Lakshmana shot an arrow into the Brahmagiri hills and brought into being the river Lakshmana tirtha when Rama asked him to fetch some water.The river descends into a water fall known as the Irupu Falls and takes a 60 meter plunge down the river amidst the lushy green mountain. This place is said to possess the power to cleanse one’s sins and is visited by thousands of devotees on Shivaratri day.Irpu Falls is around 30kms from Gonikoppa and 80 kms from Madikeri. Nagarahole is just 25 kms away from Irpu Falls.",
  			:activity_type => 'Sightseeing',
			:latitude => '11.96557',
			:longitude => '75.98368',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 8:00 AM - 7:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '5', 
			:our_rating => '4.4', 
			:image_link => '/assets/iruppu-falls.jpg',
			:inclusions => '' )
		attraction.attraction_reviews.create!(
 				:customer_name => 'Ramesh CL', 
 				:reviews =>"Wonderful spot for people who like showering in the waterfalls. Little bit of walking up the hills is required to get a glimpse of the falls. Good to see the forest officials are taking utmost care on Eco maintenance among all visitors.",
 				:rating => '4.5' )




  		attraction = place.attractions.create!(
  			:name => 'Brahmagiri Wildlife sanctuary',
  			:about => "Brahmagiri Wildlife Sanctuary was established in 1974. It is bounded by coffee and cardamom plantations.Nagarhole National Park lies on the north western edge of the sanctuary, while the state of Kerala lies on the southern boundary. Brahmagiri peak lies on the south-eastern boundary.The vegetation in the low-lying areas is predominantly evergreen and semi-evergreen (mainly of Bambusa species) forests, while shola grasslands cover the higher altitudes. The undulating terrain is dotted with several steep valleys and hillocks, and in this sanctuary, eight rivers and streams originate.",
  			:activity_type => 'Adventure',
			:latitude => '11.93168',
			:longitude => '75.99102',
			:duration => '3 hours',
			:price => '200',
			:visit_time => 'Mon - Sun 6:00 AM - 6:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4', 
			:our_rating => '3.8', 
			:image_link => '/assets/3.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Ravi Krishna', 
 				:reviews =>"Recently visited this place with friends.It is located in kodagu district.It is a very nice place for trekking.We can see a lot of wild animals on the way to trek.We can hear some beautiful melodies by birds on the way.We should be very careful as the forest is very dense and evergreen.Best place to hit is around afternoon",
 				:rating => '4.2' )



  		attraction = place.attractions.create!(
  			:name => "Gaddige Raja's Tomb",
  			:about => "Tombs of Raja’s, built on the edge of the hilltop of the town are the historical monuments which were designed and built in Indo-scenic style (Muhammadan edifices) of architecture. This is popular and thousands of the tourists visit here as it located within the town and easy to get there. There are two main tombs right side tomb is of Lingarajendra built by his son Chikkavirarajendra in A.D. 1820 and the left side of the tomb of Rudrappa (Royal Priest) which was built in 1834 and The Centre tomb is of Dodda Veerarajendra and his queen.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.433295',
			:longitude => '75.740652',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '3.2', 
			:our_rating => '3', 
			:image_link => '/assets/-64537_9838.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Rahul Kumar', 
 				:reviews =>"We stayed near to Raja-tomp so i got chance to visit it on early morning and night.In morning you feel like heaven since it filled with mist and fog.Liked: Dancing lights, Arial view, flowers ,Closing Timing is 7:30 (approx) so visit before tha",
 				:rating => '4' )
  			


  		attraction = place.attractions.create!(
  			:name => 'Byle Kuppe Golden Temple',
  			:about => "Bylakuppe is a Tibetan settlement area established by Lugsum Samdupling in 1961 and Dickyi Larsoe in 1969 and is situated to the west of Mysore District in Karnataka. It is about 6 kilometres from the twin town of Kushalanagara and is home to the magnificent Namdroling Monastery or Golden Temple. Namdroling Monastery is the largest teaching centre of Nyingmapa, a lineage of Tibetan Buddhism, in the world, and houses over five thousand monks and nuns. ",
  			:activity_type => 'Sightseeing',
			:latitude => '12.430509',
			:longitude => '75.966893',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 7:00 AM - 8:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.3', 
			:our_rating => '4.3', 
			:image_link => '/assets/Bylakuppe-600x400-600x400.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Jiri Savora', 
 				:reviews =>"Very nice and clean area. Highly recommended. In small shops they don't cheat you like in all other shops elsewhere. Very kind people these monks - if you get lucky you can take picture with them 😉 especially there is one small who loves to take pictures with everyone.",
 				:rating => '4.5' )




  		attraction = place.attractions.create!(
  			:name => "Raja’s Seat Mantapa",
  			:about => "Raja’s Seat or the Seat of the King is a famous sunset point in Madikeri in the Coorg district of Karnataka. It was once the platform from which the kings of Kodagu used to enjoy glorious sunsets. The spot got its name as it was the favourite recreational place for the kings. Today it is a famous destination of Madikeri that is visited by tourists throughout the year",
  			:activity_type => 'Sightseeing',
			:latitude => '12.414071',
			:longitude => '75.73695',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 5:30 AM - 8:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.3', 
			:our_rating => '4.1', 
			:image_link => '/assets/fixedw_large_4x.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Pankkaj R', 
 				:reviews =>"Though it was crowded when we visited but we enjoyed a lot. really good place to see sunset. Water fountain with light and music was good attraction.",
 				:rating => '4.3' )




  		attraction = place.attractions.create!(
  			:name => "The Tranquil Talacauvery and Bhagamandala",
  			:about => "Talakaveri, is the place that is generally considered to be the source of the river Kaveri. It is located by Brahmagiri hill near Bhagamandala in Kodagu district, Karnataka, 1,276 m. above sea level.",
  			:activity_type => 'Sightseeing',
			:latitude => '12.385412',
			:longitude => '75.491277',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 8:30 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.3', 
			:image_link => '/assets/Talakaveri.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Jitendra R', 
 				:reviews =>"Talacauvery is must visit place.This is after bagmandala where is there is triveni sangamam.Its not a great place just pass that and you reach talacauvery.Its the place where cauvery river has originated you can see a small pond sort and there is a temple and people workship this place.",
 				:rating => '4.5' )


  		attraction = place.attractions.create!(
  			:name => 'Nagarhole national park',
  			:about => "The Nagarahole National Park is the best place for you to exactly know where the wild truly reside. A visit to the park can be an amazing experience, one that you won’t forget for a long time in your life. Nagarahole was an exclusive hunting reserve of the former rulers of Mysore.",
  			:activity_type => 'Adventure',
			:latitude => '12.041433',
			:longitude => '76.132483',
			:duration => '4 hours',
			:price => '200',
			:visit_time => 'Mon - Sun 6:00 AM - 6:00 PM', 
			:things_to_carry => 'N/A',
			:trip_advisor_rating => '4.2', 
			:our_rating => '4', 
			:image_link => '/assets/Bison-Nagarhole-National-Park.jpg',
			:inclusions => '' )
  		attraction.attraction_reviews.create!(
 				:customer_name => 'Vedansh Agarwal', 
 				:reviews =>"I have visited Nagarhole national park many a times, and I the place has never let me down. The place has a high density of tiger, elephants and leopards. Spotting tiger is luck but leopard are in plenty. 5 hour drive form Bangalore and 1 and half hour drive form Mysore. You could stay in Kabini river lodge, Orange County, Bison resort and Water woods. Best time to visit: Open all year round, but December-June preferred",
 				:rating => '4.5' )


 #################################################################################
  	place = Place.create!( :name => 'Mangalore' )
  		attraction = place.attractions.create!(
  			:name => 'Panambur Beach',
  			:activity_type => 'Adventure',
  			:about =>"The Panambur Beach is located a few kilometers away from the main city of Mangalore and is known for its clean waters and sands and safety maintenance measures. This is the most popular beach here. The most crowds are found during the colorful carnivals organized here by the district authorities.",
  			:latitude => '12.937107',
			:longitude => '12.937107',
			:duration => '4 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.3', 
			:image_link => '/assets/xFS_123449102A10047511-DSC_6423.jpg.pagespeed.ic_.elbvkJW_o6.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Harshith', 
 				:reviews => "Very beautiful beach with port view.Well maintained beach with coast guards... Water games and sports which gives you additional fun to your trip or picnic.... Stalls and shops available for food, snacks, refreshments, clothes.",
				:rating => '4.5' )

 		attraction = place.attractions.create!(
  			:name => "St. Mary's Islands",
  			:activity_type => 'Sightseeing',
  			:about =>"The St. Mary’s island is also known as Coconut Island. It is also called Thonsepar. It is a collection of four islands in the Arabian Sea off the coast of Malpe in Udupi, Karnataka. The sea is said to have been formed after numerous volcanic activities numerous years ago and the beach is made of the cold residue of the volcanoes and is basalt."	,		
  			:latitude => '13.379845',
			:longitude => '74.672897',
			:duration => '5 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.3', 
			:image_link => '/assets/932329593StMarysIsland_Main.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Karan Rajpal', 
 				:reviews => "A great place to kill some tile and feel the wind in your hair. The scenery is great and a lot of ground to cover. It's been well maintained too. There's a lot of rocky hills to climb for all those adventurers out there. Overall, a great, peaceful tourist attractio",
 				:rating => '4.5' )

 		attraction = place.attractions.create!(
  			:name => "Kudroli Gokarnath Temple",
  			:activity_type => 'Sightseeing',
  			:about =>"The Kudroli Gokarnatheshwara Temple is one of the country’s most magnificent and beautiful temples. The feeling of peace and spirituality comes automatically within. In the 18th century there was a lot of social unrest prevailing all around and the higher society people did not allow the poor and low society people to enter the temples in which they worshipped and treated them like untouchables. The poor and illiterates had no support above them to defend them.",
  			:latitude => '12.875934',
			:longitude => '74.831421',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 8:00 AM - 8:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.7', 
			:image_link => '/assets/45_big.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Sharavan K', 
 				:reviews => "One of the most beautiful temples in Mangalore. Recommended to visit in the evening to see the lights and fountains.",
 				:rating => '4.3' )

 		attraction = place.attractions.create!(
  			:name => "Kadri Manjunath Temple",
  			:activity_type => 'Sightseeing',
  			:about =>"The Kadri Manjunatha Temple is located in Mangalore in district of Kadri in Karnataka. It is a square temple with 9 tanks and is located on the foothills of the highest mountain of Karnataka. The construction of the temple dates back to the 11th century.",
  			:latitude => '12.885635',
			:longitude => '74.855433',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 8:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.5', 
			:image_link => '/assets/1.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Nitin K', 
 				:reviews => "Good place to visit. This place has a unique history. Visit, check the temple's pond. Questions will automatically arrive.",
				:rating => '4.2' )

 		attraction = place.attractions.create!(
  			:name => "Sultan Battery",
  			:activity_type => 'Sightseeing',
  			:about =>"Sultan battery is situated in Boloor and is popular for its watch tower. It is believed to have been built by Tipu Sultan and thus the name Sultan Battery. It was built 15 years before the death of Tipu Sultan.It is completely built of black stone. You can get a fantastic panoramic view of the Arabian Sea and the surrounding places as you stand on the top of the watch tower",
  			:latitude => '12.889726',
			:longitude => '74.821149',
			:duration => '3 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '3.7', 
			:image_link => '/assets/23122006052.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Rahul A', 
 				:reviews => "It was a Old time Watch Tower . Built by some Sultan during his period .You'll get A fairy Boat ride to Tannir Bhavi Beach uptil 7.30pm .This beach is awesome !!",
 				:rating => '4.5' )



 		attraction = place.attractions.create!(
  			:name => "Sammilan Shetty's Butterfly Park",
  			:activity_type => 'Sightseeing',
  			:about =>"Butterflies as we know are one of the most amazing and beautiful creatures on earth and are also a very vital part of the ecosystem. Not only beauty but their formation and development process is in itself a fantastic thing to see from the caterpillar to a pupa and then the adult. They are a part of the food web and also are good pollinators. These beautiful creatures are in immediate need of conservation and protection and the Sammilan Shetty’s Butter Fly Park is one such association doing a fantastic job in this field. This park in the Belvai Village of Karnataka is a huge place in the heart of the Kanthavada Forest in the middle of the famous towns of Moodabidri and Karkala.",
  			:latitude => '13.122745',
			:longitude => '74.993308',
			:duration => '1 hours',
			:price => '50',
			:visit_time => 'Sun - 8:30 AM - 12:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.6', 
			:image_link => '/assets/25699243.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Mithun L', 
 				:reviews => "Great place to learn about different verieties of Butterflies, their life cycle. Must visit in season to see more verities, since I visited during Novermber end, I could able to see around 20 - 24 verities. Over all its nice experience, thanks to Mr. Sammilan Shetty for his effort in conservation if butterflies.",
 				:rating => '4.5' )


 		attraction = place.attractions.create!(
  			:name => "Surathkal Beach",
  			:activity_type => 'Sightseeing',
  			:about =>"Surathkal is a suburb of the city of Mangalore on the National Highway- 66. It is in the Dakshin Kannada District of Karnataka. It is under the supervision of the Mangalore City Corporation.According to legendary stories the name Surathkal comes from the word ‘Shiratakal’ which means headstone. This is so named because the Sadashiva Temple here was established with a shivlinga that was carried on the head of a demon named Kharasura.",
			:latitude => '12.981284',
			:longitude => '74.794522',
			:duration => '4 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/filename-img-6681-jpg.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Amit K', 
 				:reviews => "I be here whenever I visit Mangalore.The beach is seldom crowded and has a lighthouse too.Looks wonderful in the evenings and the beaten rice mix(charmuri) from the beach side vendors tastes the best.",
 				:rating => '4' )


 		attraction = place.attractions.create!(
  			:name => "Kateel Shri Durgaparameshwari Temple",
  			:activity_type => 'Sightseeing',
  			:about =>"Kateel or Kateelu is a temple town in the Dakshin Kannada district of Karnataka. It is considered as one of the holiest temple towns of India and the main attractions here is the Durgaparameshwari Temple. This beautiful temple is situated on an islet in the middle of the River Nandini. It is a very popular temple and is flocked by thousands of devotees every year.",
			:latitude => '13.043607',
			:longitude => '74.869842',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 10:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.5', 
			:image_link => '/assets/Kateel-Temple-5.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Junu K', 
 				:reviews => "MANGALADEVI, from whom the city got its name 'MANGALORE/MANGALURU' place of worship for hindus of goddess mangaladevi. At the time of Dashara is the place to enjoy in mangalore, which will be held here in temple surrounding, which consists many pooja's, taablo, huli vesha and varieties of shops for shopping during this time.",
 				:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => "Mangaladevi Temple",
  			:activity_type => 'Sightseeing',
  			:about =>"MangalaDevi Temple, built in memory of the princess of Malabar Mangale in the 10th century. The Goddess Mangale is worshiped as Shakti. The festival is celebrated during 9 days of Navaratri (October). On the seventh day, Goddess Mangaladevi is worshipped as Sharadamba and on the eighth day the goddess is worshipped as Maarikamba.",
  			:latitude => '12.849223',
			:longitude => '74.845469',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:30 AM - 8:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.6', 
			:image_link => '/assets/timthumb.jpe',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Shyama Kunda', 
 				:reviews => "Must visit place. If you are looking for surf lessons, this is the place to go. One of the best surf coaches in India as per my experience. Who really know what they are doing and all the instructor are international certified surf instructors and they are cool and chilled. They also offer other water activities such as Kayaking, windsurfing, stand up paddle, wakeboarding, dougnut ride, jestski ride and many more.",
 				:rating => '4' )
	


################################################################################

  	place = Place.create!( :name => 'Bangaluru' )
  		attraction = place.attractions.create!(
  			:name => 'Lalbagh Botanical Garden',
  			:activity_type => 'Garden',
  			:about => "One of the main tourist attractions in Bengaluru, Lalbagh is an internationally renowned centre for botanical artwork, scientific study of plants and also conservation of plants. The lush green garden is spread over an area of 240 acres in the heart of the city with nearly 1,854 species of plants and 673 genera. The collection of the plants here has made it a veritable treasure house of plants. Originally commissioned by Hyder Ali, the ruler of Mysore, it was later finished by his son Tipu Sultan. Hyder Ali laid out this popular botanical garden and his son added horticultural wealth to them by importing trees and plants from countries all over the world",
			:latitude => '12.950769',
			:longitude => '77.58474',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 7:00 PM	', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Glasshouse_and_fountain_at_lalbagh.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Adarsh Goyal', 
 				:reviews => "Well a v good place to  hangout.. but for roaming the whole garden atleast you should have 2 hrs or more so go before 4'0 clock as it closes at 6:00 PM ... Photography loving place... just visit once and  have a pleasant air with lots of pics being clicked, GO with group specially... will enjoy...yes on Good Friday and some special occasion it is open till 7:00  PM.. but on always.",
				:rating => '4.5' )


 		attraction = place.attractions.create!(
  			:name => 'Wonderla Amusement Park',
  			:activity_type => 'Amusement Park',
  			:about => "An amusement park spread over 82 acres of area and has everything that makes you have a wonderful time is what the Wonderla theme park is all about. With 55 different fun rides, Wonderla theme park offers variety of features like Water Rides, Musical Fountain, Laser Shows, Virtual Reality Shows and even a dance floor. With environmentally friendly construction and maintained levels of hygiene, Wonderla theme park continues to be a favorite for family outings, school trips and for anyone and everyone who wants to have fun.",
			:latitude => '12.834274',
			:longitude => '77.401044',
			:duration => '7 hours',
			:price => '870',
			:visit_time => 'Mon - Fri 11:00 AM - 6:00 PM & Sat - Sun 11:00 AM - 7:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.5', 
			:image_link => '/assets/sb-city-buzz_060515125707.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Suseela Raghu', 
 				:reviews => "Now this is an amazing amusement park... World class safety, brilliant standards of hygiene, cool rides, fun water games... All contribute to making wonderland Bangalore's no1 preferred amusement park.... You won't regret it... And there's a resort as an added bonus.",
				:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'MTR',
  			:activity_type => 'Food',
  			:about => "Visit city’s most treasured secret that displays the perfect blend of spices to serve the most authentic South Indian breakfast. The Idlis here are the most simplistic yet divinely tasting affair to remember. You have to have a brunch here if you are in the city!",
			:latitude => '12.980517',
			:longitude => '77.640463',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:30 AM - 11:00 AM & 12:30 PM - 2:00 PM  & 3:30 PM - 09:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/download.jpeg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Subrahmaniam P', 
 				:reviews => "The classic MTR masala dosa is what I'd recommend for breakfast or lunch here. With a touch a ghee on the golden crispy dosa, the aroma just fills the restaurant and entices your taste buds. For those working from the nearby Lavelle road, this is a great place to catch up for a quick lunch.",
				:rating => '4.2' )

 		attraction = place.attractions.create!(
  			:name => 'Bannergatta National Park',
  			:activity_type => 'National Park',
  			:about => "The Bannergatta National Park is a huge biological reserve displays a vivid range of native animals like Indian Leopard. The other fauna  in the park include: Elephants, Gaur, Jackal, Fox, Wild Boar, Sloth Bear, Sambar, Chital, Spotted deer, Barking deer, common Langur and many more. There is also an abundant range of fauna. The safari ride is not to be missed and this is one of the most alluring places to visit in Bangalore.",
			:latitude => '12.770083',
			:longitude => '77.567711',
			:duration => '3 hours',
			:price => '30',
			:visit_time => 'Mon, Wed - Sun 9:30 AM - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Bannerghatta-National-Park-Tiger.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Jagan Mohan', 
 				:reviews => "Jungle Safari is the worth going here. Rest all is similar to any other zoo. There is a lot of crowd for the jungle safari. so it is best to go by the time the place opens so that the crowd can be avoided, else you may end up waiting for hours in que for the safari trip. Please do not miss the Butterfly Park here, as it is to one corner and can easily be missed but is a good place to visit.",
				:rating => '4.2' )



 		attraction = place.attractions.create!(
  			:name => 'Vidyarthi Bhavan',
  			:activity_type => 'Food',
  			:about => "Relish the classic south Indian food like The Kesari Bath, Masala Dosa and a variety you can never get enough of at Bangalore’s priced restaurant cum eatery, the Vidyarthi bhavan!",
			:latitude => '12.945046',
			:longitude => '77.571465',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Thu 6:30 AM - 11:30 AM, 2:00 PM - 8:00 PM & Sat - Sun 7:00 AM - 12:00 PM, 2:30 PM - 8:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Vidyarthi-Bhavan.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Sashi M', 
 				:reviews => "One of the must visit joints in Bangalore if you want to taste lips smacking dosa. Very old building with seating capacity of 40 to 50 only.. Hence very crowded and one has to wait for getting the seat. But the waiting is well worth it. Here specialities are masala dosa anytime.. Idly n Poori which is served only in morning.",
				:rating => '4.2' )


 		attraction = place.attractions.create!(
  			:name => 'Cubbon Park',
  			:activity_type => 'Park',
  			:about => "City’s most cherished park located right in the heart of the city is a green enclave of vast area that will soothen your eyes with the greenery and cleanliness. You can step into the Cubbon Park, a green breath covering about 300 acres. Oak, Cassia, Gulmohar stand over grassy patches and walkways. There are secluded Nooks (best avoided when alone), Bamboo Groves and a Lotus pond. Cubbon Park allows thorough fare for cars and has public buildings like the Press Club, the State Archaeological Museum and the Seshadri Iyer Memorial Hall which hosts the State Public Library.",
			:latitude => '12.975541',
			:longitude => '77.59093',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Tue - Sun 12:00 AM - 12:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Cubbon_Park_W.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Amla S', 
 				:reviews => "Be it during early morning or lazy noon or busy evenings, coming to this place gives you a wholesome feeling of nostalgia. Been coming here as a baby, and 20 years passed on. You can never get tired of this place! ❤",
				:rating => '4.2' )


 		attraction = place.attractions.create!(
  			:name => 'Bengaluru Palace',
  			:activity_type => 'Sightseeing',
  			:about => "Built by Rev. Garrett, the first Principal of the Central High School in Bengaluru, it was bought by Chamarajendra Wodeyar in the year 1873. Built in Tudor-style architecture, it is adorned with magnificent woodcarvings. The palace holds resemblance to the medieval castles that were built in Normandy and England. Once surrounded by beautiful gardens, the palace has now not what it used to be. But, it still succeeds in attracting tourists. Gothic windows, Fortified towers, Battlements and Turrets lend a great degree of magnificence to the Bengaluru Palace. Mainly constructed of wood, it features splendid carvings and paintings.",
			:latitude => '12.998647',
			:longitude => '77.592217',
			:duration => '2 hours',
			:price => '225',
			:visit_time => 'Mon - Sun 10:00 - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.2', 
			:image_link => '/assets/bangalore-palace.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'SriKant S', 
 				:reviews => "t's a very good place to see in terms of Architectural features. The ambience and environment around the building is also enjoyable. It's a must see place in Bangalore.",
				:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'Bull Temple',
  			:activity_type => 'Temple',
  			:about => "Dedicated to Nandi Bull, the Bull Temple is also known as 'Dodda Basavana Gudi'. A colossal granite statue is the highlight of this temple. Situated inside a park called Bugle Rock, this is one of the more popular temples in all of Bengaluru. Said to be the biggest Nandi temple in the world, the stone cut image of Nandi is continually covered with new layers of butter, known as benne in the local language of Kannada.",
			:latitude => '12.942877',
			:longitude => '77.568264',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 12:00 PM , 5:30 PM - 9:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Bull-Temple-Nandi-Temple-Bangalore2.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Sachin S', 
 				:reviews => "The Dodda Ganapathi Temple, Bengaluru,is right next to the Nandi Bull temple (Dodda Basavana Guddi). The temple houses a huge idol of Lord Ganesha. The temple surroundings are very quiet and peaceful. The nearby Bugle Rock Garden is a must visit.",
				:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'Tipu Sultan Palace',
  			:activity_type => 'Sightseeing',
  			:about => "Initially built by Kempe Gowda, the founder of Bengaluru, the palace was later extended by Tipu Sultan, the Emperor of Mysore. Located near the City Market, the fort dates back to the year 1537. This majestic fort stands as a witness to the struggle of the Mysore Emperor against the British domination. The arches are intricately carved and have been built as per the Islamic style. One of the major attractions of the fort is the well-preserved Ganapati temple, which is situated inside the fort. Within the fort there is Tipu Sultan palace, which dates back to year 1790.",
			:latitude => '12.959297',
			:longitude => '77.573682',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 8:30 AM - 5:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/tipu-sultan-bangalore-palace.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Bhavik J', 
 				:reviews => "It is court of tipu Sultan.Very good architecture on wood & stone.Whole Palace & garden can completed in 1½ - 2 hr.Entry fee ₹5 for Indian citizens.different fee for foreign National & BRICS .camera allowed with no cost.",
				:rating => '4' )

 			

 		attraction = place.attractions.create!(
  			:name => 'Vidhana Soudha',
  			:activity_type => 'Sightseeing',
  			:about => "The majestic and imposing building of Vidhan Soudha houses the State Legislature. The largest Secretariat in India, its construction began in 1952 and was completed in 1956. Chief Minister of the then Mysore State, Kengal Hanumanthaiah, was responsible for the structure, the concept and the setting of this magnificent building.",
			:latitude => '12.979641',
			:longitude => '77.590678',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Fri 9:30 AM - 5:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Vidhana_Soudha_2012.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Jason F', 
 				:reviews => "The state assembly building is very majestic in the architectural sense.  It does look imposing. No entry for the general public.",
				:rating => '4' )

 		attraction = place.attractions.create!(
  			:name => 'HAL Aerospace Museum',
  			:activity_type => 'Sightseeing',
  			:about => "India’s second largest public aerospace museum, it was established in 2001 by Hindustan Aeronautics Limited (HAL). It features a museum, showcasing the history and achievements of HAL, a library, aero modeling club and a souvenir shop. Fighter planes, jets, air crafts and still more air crafts! Sky will be the limit for your little one’s excitement at Hindustan Aeronautics Limited (HAL) The Heritage Centre and Aerospace Museum. What’s more? You’ll get to use the flight simulator as well (at INR 10). Pinch yourself, it’s true! This museum has everything you want to know about the aeronautical history" ,
			:latitude => '12.954598',
			:longitude => '77.681039',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/AIR_CRAFT__amp__EN_1262459f.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Sudhamsu K', 
 				:reviews => "Extensive photo gallery covering the history of HAL in Bangalore. Out-of-action aeroplanes and helicopters on display. A brief documentary on HAL's history. Very informative for the casual visitor.",
				:rating => '4.2' )


 		attraction = place.attractions.create!(
  			:name => 'St. Mary Basilica',
  			:activity_type => 'Church',
  			:about => "A classic gothic architectural structure and one of the oldest churches of Bangalore. It is famous for the festivities held during the St. Mary's Feast in the month of September each year, an event that attracts a number of devotees from in and around Bangalore." ,
			:latitude => '12.984263',
			:longitude => '77.604541',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.5', 
			:image_link => '/assets/St.-Mary-Basilica.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Jaason Furtado',
 				:reviews => "he St. Mary's Basilica in Shivaji Nagar, Bangalore has beautiful architecture. The construction of the church is gothic in style. Most masses are usually in the mornings with one in the evenings, so expect the places to be crowded during the early part of the day.",
				:rating => '4' )


 		attraction = place.attractions.create!(
  			:name => 'Iskcon Sri Radha Krishna-chandra Temple',
  			:activity_type => 'Temple',
  			:about => "Iskcon temples are spread not just in India but also throughout the world. Iskcon temple in Bangalore is yet another attraction that will keep you spell bound to the city owing to its spiritual aura and preaching on love. Originally laid down in 1990, the Iskcon temple disseminates the ideology of love and peace through its spiritual icon, Krishna. Located at Rajajinagar, this temple boasts of being one of the largest Iskcon temples in the world. So do visit this temple for a spiritual self-reflection and faith." ,
			:latitude => '13.010411',
			:longitude => '77.550964',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 4:15 AM - 8:20 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.5', 
			:image_link => '/assets/iskcon-sri-radha-krishna.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Rohith K',
 				:reviews => " very good place that is iconic to Bangalore. The discipline, cleanliness and the ambience is very well maintained here. The Akshaya Patra mid-day meals scheme is also prepared here that has a MEGA kitchen. Do visit there if possible.",
				:rating => '4.3' )



 		attraction = place.attractions.create!(
  			:name => 'Dodda Ganapathi Temple',
  			:activity_type => 'Temple',
  			:about => "Located at the famous Bull temple road in Bangalore, the Dodda Ganapathi temple is yet another jewel in the temple trail of the city. Dodda Ganesha Temple at Basavanagudi was constructed by Kempegowda I, the founder of Bangalore. It is believed that while taking a stroll here, Kempegowda found a number of rocks and one of the boulders that had a shape of Ganesha engraved on them. Thereafter, Kempegowda ordered his sculptors to convert the shape into a massive as well as fantastic single stone idol of Lord Ganesha. Standing 18 ft tall in height and 16 ft wide, this idol looks impressive and huge." ,
			:latitude => '12.942872',
			:longitude => '77.568264',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 7:00 AM - 12:30 PM , 5:30 PM - 8:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.2', 
			:our_rating => '4.5', 
			:image_link => '/assets/59183878.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Sachin Gautam',
 				:reviews => "The Dodda Ganapathi Temple, Bengaluru,is right next to the Nandi Bull temple (Dodda Basavana Guddi). The temple houses a huge idol of Lord Ganesha. The temple surroundings are very quiet and peaceful. The nearby Bugle Rock Garden is a must visit.",
				:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'Bangalore Turf Club',
  			:activity_type => 'Club',
  			:about => "The Bangalore Turf Club Race Course is a special attraction of Bangalore city as it promises a great deal of entertainment quotient to those who visit it. People who are interested can visit an exciting day here replete with horse races. Here, you will find a variety of horse race types that includes running over obstacles, running over different distances, running on different track surfacesand running in different gaits. A visit to this place is a must for those who want to see this lavish form of entertainment." ,
			:latitude => '12.984136',
			:longitude => '77.582577',
			:duration => '3 hours',
			:price => '0',
			:visit_time => 'As per the Races', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.7', 
			:image_link => '/assets/Bangalore-Turf-Club-in-Bangalore-Carrie-Kellenberger-flickr.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Bhishan K',
 				:reviews => "Awesome race course, tough track, all horses are very impressive other track...",
				:rating => '4.2' )



 		attraction = place.attractions.create!(
  			:name => 'Butterfly Park',
  			:activity_type => 'Park',
  			:about => "As the name suggests, the Butterfly park in Bangalore is a special place for the insect world. The Park was conceptualized as one integrated center that would support education, conservation and research activities with exclusive focus on butterflies as flagship ambassadors of conservation. A visit to this place will make you get lost in the world of butterflies as well as other insects. For those who are interested in the specificities, this butterfly garden also holds a Research and captive breeding laboratory, a museum and a curio shop." ,
			:latitude => '12.796079',
			:longitude => '77.576419',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon , Wed - Sun 9:30 AM - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.7', 
			:image_link => '/assets/DSC_7082.jpg',
			:inclusions => "" )
 			attraction.attraction_reviews.create!(
 				:customer_name => 'Amit K',
 				:reviews => "Wonderful place for the kids to witness the nature so closely. Bees of different hues and colors flying in an enclosed space brings a new insight.",
				:rating => '4' )


 		attraction = place.attractions.create!(
  			:name => 'Grover Vineyards Ltd',
  			:activity_type => 'Sightseeing',
  			:about => "Something beautiful about Bangalore is that this city is also a perfect gateway to some of the most astounding weekend destinations for which you don’t have to travel much. Located at a distance of 30 kms from Bangalore Airport, the Grover Zampa Vineyard is a perfect place to go for some wine tasting. Grover Vineyards offers a chance to get a firsthand experience of the winemaking process through their personalized tours. The tour starts at the vineyard where a brief history of wines and cultivation is provided.  So click some great pics and taste some great wine for a distinct exotic experience." ,
			:latitude => '13.001345',
			:longitude => '77.597496',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 10:30 AM - 3:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.7', 
			:image_link => '/assets/Grover_theroadlesstravelled.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Nishant K',
			:reviews => "Worth visiting!! Yu can see how wines are made and they offer you to taste them, after many tasting you will a little tizzy but the large grape yards is a breathtaking view!",
			:rating => '4' )





  	place = Place.create!( :name => 'Wayanad' )
  		
  		attraction = place.attractions.create!(
  			:name => 'wayanad wildlife sanctuary',
  			:activity_type => 'Advenutre',
  			:about => "Wayanad Wildlife Sanctuary is an animal sanctuary in Wayanad, Kerala, India. It is having an extent of 344.44 km² with four ranges namely Sulthan Bathery, Muthanga, Kurichiat and Tholpetty." ,
			:latitude => '11.935833',
			:longitude => '76.00228',
			:duration => '2 hours',
			:price => '300',
			:visit_time => 'Mon - Sun 7:00 AM - 10:00 AM & 3:00 PM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.3', 
			:image_link => '/assets/wayanad_wildlife_sanctuary20131031122909_283_1.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Ashol S',
			:reviews => "Nice place. A half an hour safari through the forest. It costs entry fee Rs115 per person plus Rs500 towards jeep charge for 7 person. If u r lucky enough you may spot elephant, wild boar, peacock,  bison or deer. Chances for encounter with eliphant groups _ i had.Strictly follow the instructions of forest authorities and jeep drivers.Entry is restricted to 60 vehicles per day 40 in morning and 20 evening. Though entry to forest if from 7.00 am a queue will form 6.00 or 6.15 onwards.Prepare for the best and xpect the worst ie no animals at all.",
			:rating => '4.2' )


 		attraction = place.attractions.create!(
  			:name => 'Edakkal Caves',
  			:activity_type => 'Advenutre',
  			:about => "It is a dwelling that showcases nature’s skill and philosophy on architecture and you have to trek to about 4000 ft up a mountain to reach the place. We are talking about Edakkal Caves, which still remain a wonder and a mystery for archaeologists and historians alike." ,
			:latitude => '11.625823',
			:longitude => '76.235574',
			:duration => '3 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.3', 
			:image_link => '/assets/edakkal-caves_03.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Sabeesh S',
			:reviews => "These caves are quite old and to reach them you will have a rather steep climb to navigate. However, the experience is truly worth it. The caves are spectacular in every way.Awesome!!!",
			:rating => '4.5' )





 		attraction = place.attractions.create!(
  			:name => 'Thirunelli Temple',
  			:activity_type => 'Advenutre',
  			:about => "Thirunelli Temple is an ancient temple dedicated to Lord Maha Vishnu on the side of Brahmagiri hill in Kerala. The temple is at an altitude of about 900m in north Wayanad in a valley surrounded by mountains and beautiful forests." ,
			:latitude => '11.911629',
			:longitude => '75.995967',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 5:00 AM - 12:00 PM & 5:30 PM - 8:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/thirunelli_temple_02.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Ganesh Kumar',
			:reviews => "These caves are quite old and to reach them you will have a rather steep climb to navigate. However, the experience is truly worth it. The caves are spectacular in every way.Awesome!!!",
			:rating => '4.5' )


 		attraction = place.attractions.create!(
  			:name => 'Lakkidi View',
  			:activity_type => 'Advenutre',
  			:about => "Lakkidi is the Gateway of Wayanad district of Kerala State. It gets the second highest degree of rainfall in the world.Lakkidi is one of the highest locations in Wayanad. It is situated 700 m above mean sea level, atop Thamarassery Ghat Pass. A Tour to the rain soaked silhouettes of Lakkidi would enable the Tourists to decipher the same magic.",
			:latitude => '11.512194',
			:longitude => '76.018932',
			:duration => '4 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 12:00 AM -12 :00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.4', 
			:image_link => '/assets/lakkidi-view-point.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Victor M',
			:reviews => "Lakkidi View Point(wayanad) never a final destination. From here awesome view of Thamarassery Churam.And great road for riding. Pleasant atmosphere.",
			:rating => '4.4' )




 		attraction = place.attractions.create!(
  			:name => 'Soochipara Falls',
  			:activity_type => 'Advenutre',
  			:about => "Sentinel Rock Waterfalls is located in Wayanad district of Kerala. Locally known as Soochipara (needle rock) waterfalls, the pool at the foot of the falls is ideal for a quick dip. One of the most attractive falls in the district, the water hits the sharp spikes of granite at the base and hence the name, Sentinel Rock waterfalls.The waterfalls is located on Kozhikode - Vythiri - Gudallur Highway about 25 km from Kalpetta in Wayanad. ",
			:latitude => '11.507581',
			:longitude => '76.157892',
			:duration => '3 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '', 
			:our_rating => '', 
			:image_link => '/assets/soochipara-falls.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Aman Verma',
			:reviews => "This waterfall is located near to Mappadi just a diversion from gudallur and Ooty road . the falls is very look good but you have to walk to very steep the persons who aged is not recommendable.",
			:rating => '4.4' )



 		attraction = place.attractions.create!(
  			:name => 'Pakshipathalam bird sanctuary',
  			:activity_type => 'Advenutre',
  			:about => "Situated at an altitude of 1740m and accessible only by trekking, Pakshipathalam is home to several species of birds and is an ornithologist's paradise. It is located in the Brahmagiri Hills near Thirunelly. There is a cave here, which according to legend, was used by rishis (saints) for meditation in ancient times, has become a major attraction for tourists.",
			:latitude => '11.932617',
			:longitude => '75.993794',
			:duration => '7 hours',
			:price => '50',
			:visit_time => 'Mon - Sun 6:00 AM - 6:00 PM ', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Pakshipathalam.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'K.S Vinay',
			:reviews => "This a must do trek for wildlife and adventure lovers. The scenic beauty and wildife you get to experience is awesome.Eat light before going on this trek. Starting point is just few mins drive from JRW.",
			:rating => '4.4' )



 		attraction = place.attractions.create!(
  			:name => 'Meenmutty Falls',
  			:activity_type => 'Advenutre',
  			:about => "An interesting 2 km jungle trek will lead to the largest and most spectacular waterfall in Wayanad - Meenmutty Waterfalls. A unique feature of Meenmutty waterfalls is that the water drops from nearly 1000 ft over three stages, presenting a triple-decker effect. The falls is located on the Ooty main road in Wayanad.",
			:latitude => '11.527948',
			:longitude => '76.236707',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 5:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.7', 
			:our_rating => '3.8', 
			:image_link => '/assets/meenmutty_main_falls_2.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Hrishkesh H',
			:reviews => "Fall can be reached after a short and easy hike. The ascent towards the falls is through rocks with water flowing by. There are people appointed by the forest authorities at the locations that are slightly difficult to climb to help the tourists. The walk down is easy and through a mud trail and offers viewpoints from where you can look adjacent scenery.",
			:rating => '4.5' )



 		attraction = place.attractions.create!(
  			:name => 'kanthanpara waterfalls',
  			:activity_type => 'Advenutre',
  			:about => "Kanthanpara waterfall (also Kanthenpara) is a unique picnic spot where you could spend quality time with your family or friends. There are two waterfalls surrounded by plantations and the forest.The narrow road to this cascade is through tea gardens and coffee plantations. Among other crops that enrich the fertile slopes, it is easy to notice banana plants and betel trees.",
			:latitude => '11.559973',
			:longitude => '76.148453',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 6:00 AM - 6:00 PM ', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.4', 
			:our_rating => '3.6', 
			:image_link => '/assets/aruvikkuzhi-waterfalls-near.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Nitesh K',
			:reviews => "Nature in its wildness. Follow the stream along the side. I visited there in a foggy evening. I couldn't able to see some 10 feet away. I followed the down stream, targeting the sound of heavy falls. And it was an astonishing seen... I stood there for some minutes... I was alone, almost dark, heavy fog and the wild roar of falls... U may not get this combination and ofcourse my experience.",
			:rating => '4' )





 		attraction = place.attractions.create!(
  			:name => 'Chethalayam Falls',
  			:activity_type => 'Advenutre',
  			:about => "Chethalayam falls is located about 12 kilometres from Sulthan Batheri. Chethalayam is smaller and lesser known compared to other waterfalls in Wayanad.Probably many people may consider the long trek to the waterfall as the best part. The woods are thick and there are plenty of birds and butterflies.If all stars aligned properly, you may also spot a bit of wildlife, as you walk 4 kilometers to the waterfall.",
			:latitude => '11.765739',
			:longitude => '76.252596',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.4', 
			:our_rating => '4.2', 
			:image_link => '/assets/athirappalli_and_vazhachal_waterfalls_thrissur20131031102422_79_1.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Rajan S',
			:reviews => "Nice Place for couples",
			:rating => '3' )





 		attraction = place.attractions.create!(
  			:name => 'wayanad heritage museum',
  			:activity_type => 'Sightseeing',
  			:about => "Wayanad Heritage Museum, also known as Ambalavayal Heritage Museum is a museum at Ambalavayal, 12 km south of Sulthan Bathery, in Wayanad district, Kerala, India. It is managed by the District Tourism Promotion Council.",
			:latitude => '11.619334',
			:longitude => '76.210669',
			:duration => '2 hours',
			:price => '15',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.3', 
			:image_link => '/assets/ambalavayal-heritage.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Nilanjan S',
			:reviews => "Small museum located in Ambalavayal, showing some of the history of the location. Probably the only attraction around this area. Just something to see when visiting Edakkal Caves, can drop by here and then just walk to the bus station nearby and get a bus back to Sultan Bathery.",
			:rating => '4' )





 		attraction = place.attractions.create!(
  			:name => 'Pazhassi Raja Tomb',
  			:activity_type => 'Sightseeing',
  			:about => "Pazhassi Raja Tomb is a great place to visit if you want to know more about Wayanad. The destination offers a sneak peek into the history of the place. So visit the tomb and you will be happily surprised as there is also a museum which will show you the history of the destination. From ancient artefacts to relics of national importance the location is a must visit for anyone who comes this way.",
			:latitude => '11.801508',
			:longitude => '76.000682',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 9:00 AM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.4', 
			:our_rating => '4', 
			:image_link => '/assets/Pazhassi_tomb_-waynad.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Neerav K',
			:reviews => "Kerala varma Pazhassi Raja the lion of the kerala resting place.Calm and Beautiful and there is a small museum under the tomb displayed articles and paintings of pazhassi's time.",
			:rating => '4.5' )





 		attraction = place.attractions.create!(
  			:name => 'Chembra Peak',
  			:activity_type => 'Sightseeing',
  			:about => "Chembra Peak is one of the most picturesque trekking experiences that you can have. The destination is all about the charming scenery and a view that will blow you away. The whole setting of the location is nothing less than a dream. The climb up the peak can be challenging at some times so remember to pack good hiking shoes. The destination offers spectacular views and a trekking experience that you can enjoy with your family and friends.",
			:latitude => '11.511755',
			:longitude => '76.0887',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun 7:00 AM - 5:00 PM ', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.4', 
			:our_rating => '4.2', 
			:image_link => '/assets/chembra_peak_in_wayanad20131119171528_508_2.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Rajat K',
			:reviews => "I visited this place last week and as we had a kid we could go just till the view point. The ticket counter opens at 7AM and I recommend you reach this place by then as the parking place gets pretty crowded (luckily I reached there by 7 and could get away from the scorching sunlight)",
			:rating => '3.5' )





  	place = Place.create!( :name => 'Gokarana' )

  		attraction = place.attractions.create!(
  			:name => 'Om Beach',
  			:activity_type => 'Beach',
  			:about => "Located just adjacent to Kudle beach, Om beach has a very calm and serene vibe to it. The sand here is much finer than the Kudle beach. The beach has been named as ‘Om’ since its shape resembles the Sanskrit word ‘Om’, when seen from above. A good place for long strolls, there are a couple of restaurants nearby for refreshments. There are also a few shacks and huts for relaxation.",
			:latitude => '14.519271',
			:longitude => '74.322993',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Om-Beach-Gokarna2.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Windy S',
			:reviews => "Om beach is exactly where you should go if you want to chant omkaras or meditate. The was is not very safe to play in. But the beach is calm and peaceful. There were hardly any people on the beach at the time we visited. The water is clean, blue.",
			:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'Kudle Beach',
  			:activity_type => 'Beach',
  			:about => "One of the five main beaches in the town of Gokarna, Kudle beach lies about 6 kms to its south. It’s a nice C shaped beach with clean sand, clear waters and cool breeze. Weekends are a bit crowded as it attracts a lot of locals while weekdays are silent and less occupied. There’s simple accommodation of huts and tents nearby. A beautiful beach to relax yourself with family and friends.",
			:latitude => '14.528689',
			:longitude => '74.3153',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.2', 
			:image_link => '/assets/kudle-beach-shacks.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Nitin A',
			:reviews => "Visit this beach you love it...Neat & clean & not very crowded. One Hanuman Ji temple is also near this beach. If you want to stay huts are also available near the beach in budget range.",
			:rating => '4.2' )



 		attraction = place.attractions.create!(
  			:name => 'Gokarna Beach',
  			:activity_type => 'Beach',
  			:about => "The Gokarna Beach, also known as Indian beach is the most popular as well the most dirty amongst all other beaches. Pilgrims visit this beach as it is closest to the temple resulting in it being crowded most of the time. The waters here are not suitable for bathing but it’s still a nice place to visit.",
			:latitude => '14.54464',
			:longitude => '74.313154',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '3.7', 
			:image_link => '/assets/Gokarna-Beach-Resort-Karnataka-2-3767.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Ashish Dutta',
			:reviews => "It's a nice and uncrowded beach.stayed in Namaste Beach Café. Great ambience & view from the restaurant. Om beach is less crowded than half moon beach, but very few hotels are available.",
			:rating => '4' )




 		attraction = place.attractions.create!(
  			:name => 'Mahabaleswara Temple',
  			:activity_type => 'Temple',
  			:about => "One of the most important attractions of Gokarna, The temple is very well known because of a beautiful legend attributed to it. It is here where Ravana, the demon king had to rest the ‘Atmalinga’ statue when he was tricked by Lord Ganesh who at last built a temple around. The temple is built in proper Dravidian architecture. It is said that Shivaji, the great emperor had visited this temple once to offer his prayers. The carved stone image of Lord Shiva inside the sanctum is said to be 1500 years old.",
			:latitude => '14.543541',
			:longitude => '74.316704',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  6:00 AM - 12:30 PM & 5:00 PM - 8:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/Gokarna-Temple1.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'VidhyaSagar Achar',
			:reviews => "Beautiful temple of Lord Shiva.You get to offer some special pujas yourself to the main ancient atmalinga. Priests do insist on dakshinas though.",
			:rating => '4' )



 		attraction = place.attractions.create!(
  			:name => 'Paradise Beach',
  			:activity_type => 'Beach',
  			:about => "A beach fit for its name, the Paradise Beach is located just ahead of Om Beach. Usually remains less occupied since it has to be reached either from ferry or by a trek through the forests. The view from the cliffs is simply splendid, the sand here is clean and the waters are azure. This beach is surely worth a visit for those with a deep wanderlust. You can stay at a shack for a cheap prize.",
			:latitude => '14.518198',
			:longitude => '74.337377',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/paradise-beach-gokarna.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Sneha A',
			:reviews => "Since the path to the beach is not an easy walk, there are few tourists at this beach. However it's a good one for trekkers.a beautiful beach nonetheless, with rocks and strong waves. Try not to wade too much into the beach, as a precaution.",
			:rating => '4' )


 		attraction = place.attractions.create!(
  			:name => 'Half Moon Beach',
  			:activity_type => 'Beach',
  			:about => "A nice small beach on the way to Paradise beach, Half Moon is located just next to Om beach. Its crescent shaped shore has a fine sand and clean waters. There are shacks where you can relax and sip a chilled beer if you like. Some also play soccer and volleyball here as the sand area is quite big.",
			:latitude => '14.518037',
			:longitude => '74.331507',
			:duration => '2 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 AM - 12:00 AM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4.5', 
			:our_rating => '4.5', 
			:image_link => '/assets/Half moon beach Gokarna.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Rajesh Huni',
			:reviews => "You need to trek or hire a boat to reach this beach. The beach is very secluded. There are some restaurants on the beach. It will be worth the trek. During the trek the view of the ocean from the hill top will be amazing.",
			:rating => '4.3' )





 		attraction = place.attractions.create!(
  			:name => 'Maha Ganpati Temple',
  			:activity_type => 'Temple',
  			:about => "Quite an old temple with an even older idol of Lord Ganesh, Maha Ganapati Temple is located near to Mahabaleshwar Temple. It is dedicated to the legend of Lord Ganesh where he played a trick on the Demon king Ravana. The idol in the sanctum is said to be 1500 years old. It’s a nice temple to visit and to offer prayers.",
			:latitude => '14.543551',
			:longitude => '74.316361',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  5:00 AM - 12:00 PM & 4:00 PM - 9:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/shree-abhaya-mahaganapathi1.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Alok Verma',
			:reviews => "Very ancient temple. Well organised queue system. Opens at 6am. Closes at 8:30pm. Narrow streets around the temple. So car parking is little difficult. Not sure if there was a designated parking also somewhere.",
			:rating => '4.2' )





 		attraction = place.attractions.create!(
  			:name => 'Kotitirtha',
  			:activity_type => 'Sightseeing',
  			:about => "Kotitirtha is small pond towards the south eastern end of Mahabaleshwar temple. The pond holds a spiritual significance and hence a lot of people use this place for bathing and other religious purposes. In the month of November a lot of people come here to light small earthen lamps and set them afloat on the pond which is a beautiful sight to watch.",
			:latitude => '14.541785',
			:longitude => '74.320765',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  12:00 PM - 11:59 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '3.5', 
			:our_rating => '2.7', 
			:image_link => '/assets/8086.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Veshwa H',
			:reviews => "Kotiteeertha is a lake with lot of spiritual significance in gokarna. It is believed to be containing millions of sacred water sourse combined. Water is polluted a lot now.",
			:rating => '3' )




 		attraction = place.attractions.create!(
  			:name => 'Mirjan Fort',
  			:activity_type => 'Sightseeing',
  			:about => "Located about 11 km away from Gokarna town, Mirjan Fort still stands strong overlooking the lush green plateau. There’s still confusion among historians regarding the exact time of construction of this fort. The fort has strong tall walls and bastions built with laterite stones and have four entrances. Inside you’ll find many wells, tunnels and secret entrances some of them which lead to the canal. Monsoon is usually the best time to visit the fort.",
			:latitude => '14.488851',
			:longitude => '74.41755',
			:duration => '1 hours',
			:price => '0',
			:visit_time => 'Mon - Sun  11:00 PM - 7:30 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/ceefa07119e77f7b23dee0474932545b.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Deepak G',
			:reviews => "A good scooter ride away from the main city and beaches is this lovely fort. Even if you're not into history, you'll be taken aback by this. Admire the architecture of a bygone era and take plenty of pics. Have coconut water outside and ride back to town.",
			:rating => '4' )


		attraction = place.attractions.create!(
  			:name => 'Anshi National Park',
  			:activity_type => 'Sightseeing',
  			:about => "Anshi National Park is located at a distance of 60 km from Karwar in Uttara Kannada district. Anshi National Park is spread about 340 sq km and adjoins the Dandeli wildlife sanctuary.The forest in the area was declared the Dandeli wildlife sanctuary on 10 May 1956. A section of Dandeli wildlife sanctuary was carved out to form the Anshi National Park. Anshi National Park has been granted the status of Project Tiger sanctuaries in January 2007.Anshi National Park is located in an eco-sensitive part of the Western Ghats, at a height between 200 m to 925 m above sea level.",
			:latitude => '14.998048',
			:longitude => '74.358597',
			:duration => '4 hours',
			:price => '400',
			:visit_time => 'Mon - Sun 6:00 AM - 8:30 AM & 4:00 PM - 6:00 PM', 
			:things_to_carry => "",
			:trip_advisor_rating => '4', 
			:our_rating => '4.2', 
			:image_link => '/assets/1353.jpg',
			:inclusions => "" )
 		attraction.attraction_reviews.create!(
			:customer_name => 'Sujay Kumar',
			:reviews => "Best route to reach South Goa with own vehicle,one can feel the nature in the midst of thick forest and the cold breeze flows throughout the route.Ghats are dangerous so Drive slow.",
			:rating => '4' )


end

if HotelDetail.last.nil?

    HotelDetail.create!(:property_id => '1262290',
    :latitude => '12.978169',
    :longitude => '77.579',
    :facilities => 'Car Park,Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Safe,Direct Dial,Telephone	Mini Bar,TV - Satellite/Cable,TV - Standard	WIFI - Internet Access	')

    HotelDetail.create!(:property_id => '1214755',
    :latitude => '12.95837692',
    :longitude => '77.65633652',
    :facilities => 'Gym, Lift, Room Service - 24 hours	')

    HotelDetail.create!(:property_id => '1206772',
    :latitude => '12.9783',
    :longitude => '77.57938',
    :facilities => 'Car Park,Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Safe,Mini Bar	TV - Satellite/Cable,TV - Standard,WIFI - Internet Access')

    HotelDetail.create!(:property_id => '1508755',
    :latitude => '12.960418',
    :longitude => '77.637039',
    :facilities => 'Car Park,Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Safe,Direct Dial Telephone,Fridge,Mini Bar,TV - Satellite/Cable,TV - Standard	WIFI - Internet Access')

    HotelDetail.create!(:property_id => '1273522',
    :latitude => '12.9967',
    :longitude => '77.5783',
    :facilities => 'Car Park,Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Safe,Direct Dial,Telephone	TV - Standard,WIFI - Internet Access	')

    HotelDetail.create!(:property_id => '1228629',
    :latitude => '12.9786313',
    :longitude => '77.57806778',
    :facilities => 'Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Air Conditioning - Room,Direct Dial Telephone,Fridge,Hair,Dryer,Mini,Bar	TV - Satellite/Cable,TV - Standard	WIFI - Internet Access')

    HotelDetail.create!(:property_id => '1206774',
    :latitude => '12.98066',
    :longitude => '77.57481',
    :facilities => 'Conference Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Safe,Terrace,Direct Dial Telephone,Hair Dryer,Mini Bar,TV - Satellite/Cable,TV - Standard,WIFI - Internet Access')

    HotelDetail.create!(:property_id => '1063677',
    :latitude => '12.98306',
    :longitude => '77.60253',
    :facilities => 'Car Park,Conference,Facilities,Laundry Service,Medical Facilities,Room Service - 24 hours,Air Conditioning - Room,Direct Dial Telephone,Fridge,TV - Satellite/Cable,TV - Standard')

    HotelDetail.create!(:property_id => '1644185',
    :latitude => '12.9698',
    :longitude => '77.749947',
    :facilities => 'Conference Facilities,Gym,Laundry Service,Medical Facilities,Room Service - 24 hours,Air Conditioning - Room,Direct Dial Telephone,Hair,Dryer,Mini Bar,TV - Standard,WIFI - Internet Access	')

    HotelDetail.create!(:property_id => '1508826',
        :latitude => '28.6416115500',
        :longitude => '77.2111817600',
        :facilities => 'Car Park,Car Rental,Laundry Service,Room Service - 24 hours')

    HotelDetail.create!(:property_id => '1490491',
                :latitude => '28.6524435000',
                :longitude => '77.1916497000',
                :facilities => '')

end
