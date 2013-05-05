class MyAdmin::BaseController < ApplicationController
  
  before_filter :init
  layout 'admin_area'
  
  attr_reader :model
  
  def index
    @html = MyAdmin::ModelConfigs::Config.new('faculty').actions
  end

  def model_action
    @model = MyAdmin::Models.const_get(params[:model].classify).new
    data = {}
    params.each_pair do |k,v|
      unless ['controller', 'action', 'model', 'act'].include? k
        data[k] = v
      end
    end
    #@html = @model.send(params[:act], [data])
    @html = @model.action_do(params[:act], [data])

  rescue ClassNotDefinedError => e
    @html = e.message
  rescue ActiveRecord::RecordNotFound => e
    @html = e.message
  #rescue ArgumentError => e
  #  @html = 'System fail: ' + e.message
  #rescue => e
  #  @html = 'Base system fail: ' + e.message
  end
  
  #def edit
  #  #@object = ('MyAdmin::Models::' + @model.classify.to_s).constantize.new.edit(params[:id])
  #  @model = MyAdmin::Models.const_get(@short_model_name.classify).new
  #  @html = @model.edit(params[:id])
  #end
  #
  #def save
  #  @object = ('MyAdmin::Models::' + @short_model_name.classify.to_s).constantize.new.save(params[@short_model_name])
  #
  #  if @object
  #    flash[:notice] = 'Saved!'
  #    redirect_to :action => :index
  #  else
  #    flash[:notice] = 'Error occured!!!'
  #    redirect_to :back
  #  end
  #end
  
  
  private 
  
  def init

    @short_model_name = controller_name
    #@model_object = ('MyAdmin::' + @@name.classify.to_s).constantize.new
  end
end