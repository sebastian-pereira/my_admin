class MyAdmin::BaseController < ApplicationController
  
  before_filter :init
  layout 'admin_area'
  
  attr_reader :model
  
  def index
    #@html = ActiveRecord::Base::University.reflect_on_all_associations.map { |assoc| assoc}
  end

  def model_action
    @model = MyAdmin::Models.const_get(params[:model].classify).new
    data = {}
    params.each_pair do |k,v|
      unless ['controller', 'action', 'model', 'act'].include? k
        data[k] = v
      end
    end
    @html = @model.send('action_' + params[:act].to_s, data)
    #@html = @model.action_do(params[:act], [data])

  #rescue ClassNotDefinedError => e
  #  @html = e.message
  #rescue ActiveRecord::RecordNotFound => e
  #  @html = e.message
  #rescue ArgumentError => e
  #  @html = 'System fail: ' + e.message
  #rescue => e
  #  @html = 'Base system fail: ' + e.message
  end
  
  private
  
  def init
    @short_model_name = controller_name
    #@model_object = ('MyAdmin::' + @@name.classify.to_s).constantize.new
  end
end