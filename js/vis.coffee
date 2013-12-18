
inHoods = {'MAGNOLIA': 1, 'BALLARD': 1, 'INTERBAY':1, 'QUEEN ANNE':1, 'DOWNTOWN':1}
apiKey = "088d3df822cb4b33b9d95e9cedf889a5"
# seattle = [47.60620950083183, -122.3320707975654]
seattle = [47.66, -122.3320707975654]

$ ->
  $("#about_link").on 'click', (e) ->
    e.preventDefault()
    $('.navbar li').removeClass("active")
    $(this).parent().addClass("active")

    hash = this.hash
    $('html, body').animate({
      scrollTop: $(this.hash).offset().top
    }, 300)#, () -> window.location.hash = hash)

  mapLocations = L.map('locations_map').setView(seattle, 12)
  # L.tileLayer('http://{s}.tile.cloudmade.com/' + apiKey + '/116624/256/{z}/{x}/{y}.png', {
    # attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  # }).addTo(mapLocations)
  l = new L.StamenTileLayer("toner").addTo(mapLocations)

  # mapLocations.dragging.disable()
  mapLocations.touchZoom.disable()
  mapLocations.doubleClickZoom.disable()
  mapLocations.scrollWheelZoom.disable()
  mapLocations.boxZoom.disable()
  mapLocations.keyboard.disable()

  mapRegion = L.map('region_map').setView(seattle, 12)
  # L.tileLayer('http://{s}.tile.cloudmade.com/' + apiKey + '/116624/256/{z}/{x}/{y}.png', {
    # attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  # }).addTo(mapRegion)
  l = new L.StamenTileLayer("toner").addTo(mapRegion)

  # mapRegion.dragging.disable()
  mapRegion.touchZoom.disable()
  mapRegion.doubleClickZoom.disable()
  mapRegion.scrollWheelZoom.disable()
  mapRegion.boxZoom.disable()
  mapRegion.keyboard.disable()

  filterHoods = (feature) ->
    if inHoods[feature.properties['L_HOOD']] == 1
      true
    else
      false

  hoodStyle = {
    "color": "#ff7800",
    "weight": 3,
    "opacity": 0.7
  }
  
  eachHood = (feature, layer) ->
    layer.bindPopup(feature.properties['L_HOOD'])

  displayHoods = (json) ->
    L.geoJson(json, {filter:filterHoods,style:hoodStyle,onEachFeature:eachHood}).addTo(mapRegion)

  d3.json('data/hoods.json', displayHoods)
  
