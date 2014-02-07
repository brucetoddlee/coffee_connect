tests = []

tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "3.0", upload: "1.0", latency:"15", jitter:"15")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "4.0", upload: "2.0", latency:"12", jitter:"11")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "4.0", upload: "2.0", latency:"14", jitter:"12")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "4.4", upload: "1.5", latency:"11", jitter:"13")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "2.9", upload: "1.0", latency:"16", jitter:"16")

tests << Test.create(yelp_id: "philz-coffee-san-francisco", download: "5.0", upload: "2.0", latency:"12", jitter:"11")
tests << Test.create(yelp_id: "philz-coffee-san-francisco", download: "4.0", upload: "1.5", latency:"16", jitter:"19")
tests << Test.create(yelp_id: "philz-coffee-san-francisco", download: "2.0", upload: "1.5", latency:"18", jitter:"13")

tests << Test.create(yelp_id: "spin-city-coffee-san-francisco", download: "8.0", upload: "2.0", latency:"9.1", jitter:"7.0")
tests << Test.create(yelp_id: "spin-city-coffee-san-francisco", download: "9.0", upload: "3.5", latency:"8.2", jitter:"9.2")

tests << Test.create(yelp_id: "la-stazione-coffee-and-wine-bar-san-francisco", download: "1.0", upload: "0.5", latency:"22", jitter:"27")
tests << Test.create(yelp_id: "la-stazione-coffee-and-wine-bar-san-francisco", download: "1.5", upload: "0.8", latency:"25", jitter:"30")

tests << Test.create(yelp_id: "cento-san-francisco", download: "2.0", upload: "1.2", latency:"20", jitter:"22")
tests << Test.create(yelp_id: "cento-san-francisco", download: "3.0", upload: "0.7", latency:"19", jitter:"24")

tests << Test.create(yelp_id: "trouble-coffee-company-san-francisco-2", download: "7.0", upload: "4.0", latency:"15", jitter:"15")
tests << Test.create(yelp_id: "trouble-coffee-company-san-francisco-2", download: "5.2", upload: "3.0", latency:"15", jitter:"15")

tests << Test.create(yelp_id: "philz-coffee-san-francisco-8", download: "3.0", upload: "1.0", latency:"15", jitter:"15")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-8", download: "2.2", upload: "1.1", latency:"20", jitter:"19")

tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "3.0", upload: "1.0", latency:"19", jitter:"20")
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "3.2", upload: "1.5", latency:"18", jitter:"20")
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "4.0", upload: "2.0", latency:"15", jitter:"15")
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "5.0", upload: "3.0", latency:"11", jitter:"10")
