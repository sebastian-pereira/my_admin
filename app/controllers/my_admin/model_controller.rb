class MyAdmin::ModelController < ApplicationController
  
  layout 'admin_area'
  before_filter :init
  def index
    class_model_object = MyAdmin::Fields::Model.new(@model)
    @fields = class_model_object.format_fields
    @field_labels = YAML.load_file("../../config/fields.yml")

    @fields_for_create = class_model_object.gen_creation_fields

    @relations = class_model_object
  end

  def save
    params[:fields].each do |f|
      f.each do |p|
        if p == ''
          #redirect_to :back
        end
      end
    end
    class_model_object = MyAdmin::Fields::Model.new(@model)
    @hs = class_model_object.save(params[:fields])

    redirect_to :action => :index
  end

  def add_field

    if params[@model][:sys_name].empty? or params[@model][:label].empty? or params[@model][:position].empty?
      flash[:add_field] = 'Empty values unavailable'
      redirect_to :back
    else
      class_model_object = MyAdmin::Fields::Model.new(@model)
      @fields = class_model_object.format_fields
      class_model_object.add_field(params[@model])
      redirect_to :back
    end

  end

  private

  def init
    @model = params[:model]
  end
end