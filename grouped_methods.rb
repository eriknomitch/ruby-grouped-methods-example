# ================================================
# RUBY->GROUPED-METHODS ==========================
# ================================================

# ------------------------------------------------
# MODULE->GROUPED-METHODS ------------------------
# ------------------------------------------------
module GroupedMethods

  module Initializer
    def initialize
      method_groups.each do |method_group_name, sub_methods|
        sub_methods.each do |sub_method_name, sub_method_proc|
          self.send(method_group_name).define_singleton_method sub_method_name, &sub_method_proc
        end
      end

      super
    end
  end

  module ClassMethods
    def define_grouped_method(group_name, sub_method_name, &block)

      # Ensure hash
      self.method_groups[group_name] ||= {}

      # Ensure attribute
      module_eval { attr_accessor group_name }

      self.method_groups[group_name][sub_method_name] = block

      module_eval {
        define_method sub_method_name do
        end
      }
    end

  end

  def self.included(base)
    base.send :extend, ClassMethods
    base.send :prepend, Initializer

    base.instance_eval do
      cattr_accessor :method_groups
    
      self.method_groups = {}
    end
  
  end
end
