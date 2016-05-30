json.properties @properties do |p|
    json.id p.id
    json.name p.name
    json.rating p.rating
    json.our_rating p.our_rating
    json.country p.country
    json.region p.region
    json.resort p.resort
    json.description p.description
    json.latitude p.latitude
    json.longitude p.longitude
    json.facilities p.facilities
    json.match_count p.match_count
    json.priority p.priority
    json.sub_total p.sub_total
    json.discount p.discount
    json.total p.total
    json.image p.image()
    json.image_thumbnail p.image_thumbnail()
end