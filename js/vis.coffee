

$ ->
  apiKey = "088d3df822cb4b33b9d95e9cedf889a5"
  seattle = [47.60620950083183, -122.3320707975654]
  seattle = [47.66, -122.3320707975654]

  map = L.map('locations_map').setView(seattle, 12)
  L.tileLayer('http://{s}.tile.cloudmade.com/' + apiKey + '/116624/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  }).addTo(map)
  
