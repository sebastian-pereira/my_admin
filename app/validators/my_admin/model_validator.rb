class MyAdmin::ModelValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:names] << "!"
  end
  
  private
  
  
end