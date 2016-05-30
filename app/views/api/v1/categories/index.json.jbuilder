json.categories @categories do |category|
	json.id category.id
	json.name category.name
	
	json.image_link category.image_link
	json.activities category.activities do |act|
		json.id act.id
		json.name act.name
		json.image_link act.image_link
	end
end