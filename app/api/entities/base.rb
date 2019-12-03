module Entities
  class Base < Grape::Entity
    class_attribute :incoming_param_defs, default: {}
    class_attribute :model_class
    class_attribute :callbacks_when_model_defined, default: []
    class_attribute :callbacks_after_params_assignment, default: []

    class << self
      def expose(exposed, options = {}, &blk)
        options_ext = options.dup
        options_ext[:non_aliased_name] = exposed
        self.incoming_param_defs[options_ext[:as] || exposed] = options_ext

        run_when_model_is_defined do
          super(exposed, modelize(options), &blk)
        end
      end

      def model=(klass)
        # TODO: implement a model register to be called when method is called several
        # times with the same model so as to prevent interferences. Use dup-ped
        # versions of self each time.
        run_callbacks = self.model_class.nil?
        self.model_class = klass
        callbacks_when_model_defined.each(&:call)

        self
      end

      def run_when_model_is_defined(&blk)
        blk.call if self.model_class

        callbacks_when_model_defined << blk
      end

      def postable_params_definitions
        documentation.reject { |param_name, doc| doc[:readonly] }
      end

      def assign_to_instance(params, instance: nil)
        instance ||= self.model_class.new
        model_attrs, non_model_attrs, undefined_params = categorize(params, instance: instance)
        raise "Attributes '#{undefined_params.keys.join(', ')}' cannot be understood." if undefined_params.any?
        instance.assign_attributes(model_attrs)
        callbacks_after_params_assignment.each do |prok|
          prok.call(non_model_attrs, instance)
        end

        instance
      end

      private

      def after_params_assignment(&blk)
        self.callbacks_after_params_assignment << blk
      end

      def modelize(options_stub)
        options_stub # TODO: base on model
      end

      def categorize(params, instance: nil)
        model_attrs = {}.with_indifferent_access
        non_model_attrs = {}.with_indifferent_access
        undefined_params = {}.with_indifferent_access
        params.each do |param_name, param_value|
          options = incoming_param_defs[param_name.to_sym]
          unless options
            undefined_params[param_name] = param_value
            next
          end
          if instance.respond_to?("#{options[:non_aliased_name]}=")
            if options.key?(:using)
              assoc = options[:using].assign_to_instance(param_value, instance: instance.send(options[:non_aliased_name]))
              model_attrs[options[:non_aliased_name]] = assoc
              next
            else
              model_attrs[options[:non_aliased_name]] = param_value
              next
            end
          end
          non_model_attrs[param_name] = param_value
        end

        [model_attrs, non_model_attrs, undefined_params]
      end
    end
  end
end
