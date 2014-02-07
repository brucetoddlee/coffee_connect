tests = []
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "3.0", upload: "1.0", latency:"20", jitter:"20")
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "4.0", upload: "2.0", latency:"15", jitter:"15")
tests << Test.create(yelp_id: "coffeeshop-san-francisco", download: "5.0", upload: "3.0", latency:"10", jitter:"10")

tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "30.0", upload: "10.0", latency:"200", jitter:"200")
tests << Test.create(yelp_id: "philz-coffee-san-francisco-3", download: "40.0", upload: "20.0", latency:"150", jitter:"150")
