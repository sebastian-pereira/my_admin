module MyAdmin
  module Record

    attr_reader :object, :relations, :class_simple_name

    attr_accessor :viewable, :editable, :deletable

    def initialize(orm, actions = [], view_relations = true)

      @relations = []
      @class_simple_name = class_single_name(self.class)
      @view_relations = view_relations

      if orm
        @object = orm
        if @view_relations
          @relations = init_relations
        end
      end

      # Объект, генерирующий поля объекта в соответствии с типом
      @fields_composer = MyAdmin::Records::Composers::FieldComposer.new(orm)
      @fields_composer.init_objects

      @view_directory = File.dirname(__FILE__) + "/../views/records"

      @labels = object_labels

      @actions = actions

    end

    def delete
      @object.class.reflect_on_all_associations.each do |assoc|
        @object.send(assoc.name).each do |obj|
          obj.delete
        end
      end
      @object.delete
    end

    # Метод возвращает поля в соответствии с типами. Используестся, например, для редактирования.
    def object_fields
      @fields_composer.objects.collect{|field| field.get_render_object}
    end

    # Метод возвращает текстовые представления полей. Используется, например, для просмотра.
    def object_labels(include_relations = false, as_child = false)
      @fields_composer.objects.collect{|field| field.view_render_object}
    end

    def render(type, with_relations = true)
      erb = ERB.new(File.read(@view_directory + "/#{type}.html.erb"))
      erb.result(binding).html_safe
    end


    private

    def init_relations
      relations = YAML.load_file("../../config/table_configs/#{@class_simple_name}.yml")
      if relations['relations']
        relations = relations['relations']
      else
        relations = {}
      end

      relation_objects = {}

      relations.each_pair do |k, v|
        type = v['type']
        name = k
        if v['visible'] == '1'
          fl = true
        else
          fl = false
        end
        relation_objects[k] = MyAdmin::Records::Relations.const_get(v['type'].camelize).new(k, v['label'], v['type'], fl && @view_relations, @object)
      end

      relation_objects
    end

  end
end