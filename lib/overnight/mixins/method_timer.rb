module Overnight
  module MethodTimer

    def self.included(base_class)
      methods = base_class.instance_methods(false) + base_class.private_instance_methods(false)
      base_class.class_eval do
        methods.each do |method_name|
          old_method = instance_method(method_name)
          define_method(method_name) do |*args, &block|
            logged_name = Overnight::MethodTimer.timer_name(base_class.name + "_" + method_name.to_s)
            OvernightService.start_timer(logged_name)
            result = old_method.bind(self).call(*args, &block)
            OvernightService.stop_timer(logged_name)
            return result
          end
        end
      end
    end

    def self.timer_name(name)
      name.scan(/[A-Z][a-z_]*/).join("_").downcase.to_sym
    end

    #       module MethodLogger
    #   def self.included(base)
    #     methods = base.instance_methods(false) + base.private_instance_methods(false)
    #     base.class_eval do
    #       methods.each do |method_name|
    #         original_method = instance_method(method_name)
    #         define_method(method_name) do |*args, &block|
    #           Rails.logger.info "-> #{base}##{method_name}(#{args.inspect})"
    #           return_value = original_method.bind(self).call(*args, &block)
    #           Rails.logger.info "<- #{base}##{method_name} #=> #{return_value.inspect}"
    #           return_value
    #         end
    #       end
    #     end
    #   end
    # end
  end
end
