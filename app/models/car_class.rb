class CarClass < ActiveRecord::Base
  has_many :versions

  scope :sorted, -> { order(:name) }

  before_destroy :remove_associations

  after_save :set_version_vclasses, if: :name_changed?

  def remove_associations
    self.versions.each do |version|
      version.car_class = nil
      version.save
    end
  end

  def merge(other, new_name)
    self.name = new_name
    self.save
    other.versions.each do |version|
      version.car_class = self
      version.save
    end
    other.delete
  end

  def set_version_vclasses
    self.versions.each do |version|
      version.set_vclass
      version.save
    end
  end
end
