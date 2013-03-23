class AddNullFalseToActivityPlans < ActiveRecord::Migration
  def change
    change_column_null :activity_plans, :activity_id, false
    change_column_null :activity_plans, :plan_id, false
    change_column_null :activity_plans, :sequence, false, 0
  end
end