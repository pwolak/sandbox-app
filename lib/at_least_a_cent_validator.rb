class AtLeastACentValidator < ActiveModel::EachValidator
  
  def validate_each(object, attribute, value)
    if value.is_a?(Numeric) and value < 0.01
      object.errors[attribute] << "should be at least 0.01"
    end
  end
  
end