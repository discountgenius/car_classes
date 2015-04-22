class AddCarClassToVersions < ActiveRecord::Migration
  def change
    add_reference :versions, :car_class, index: true
  end
end
