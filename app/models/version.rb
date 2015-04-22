class Version < ActiveRecord::Base
  
  belongs_to :car_class

  before_save :set_vclass, if: :car_class_id_changed?

  def self.initialize_car_classes
    Version.find_each(&:initialize_car_class)
  end

  def initialize_car_class
    if !self.vclass.blank?
      self.car_class = CarClass.find_by(name: self.vclass)
      if self.car_class.nil?
        self.car_class = CarClass.create(name: self.vclass)
      end
      self.save
    end
  end

  def set_vclass
    if self.car_class.nil?
      self.vclass = nil
    else
      self.vclass = self.car_class.name
    end
  end
end
