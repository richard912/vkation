json.budgets @budgets do |budget| 
	json.id budget.id
	json.range budget.start_range.to_s + " to " + budget.end_range.to_s
end