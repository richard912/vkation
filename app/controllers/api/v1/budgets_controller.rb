class Api::V1::BudgetsController < Api::V1::BaseController
	def index
		@budgets = Budget.all
	end
end
