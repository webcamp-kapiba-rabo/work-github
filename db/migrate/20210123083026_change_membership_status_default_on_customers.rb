class ChangeMembershipStatusDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :membership_status, from: false, to: true
  end
end
