# Finds all Bootstrapper classes and executes `run` on them, respecting any
# declared dependencies.
class BootstrapRunner
  def self.call
    new.call
  end

  def call
    classes_to_be_run = all_classes
    ran_classes = []
    while classes_to_be_run.count > 0
      klass = classes_to_be_run.shift
      if klass.runnable?(ran_classes)
        klass.run
        ran_classes << klass
      else
        classes_to_be_run << klass
      end
    end
  end

  def all_classes
    ObjectSpace
      .each_object(Class)
      .select { |c| c.singleton_class.ancestors.include?(Bootstrapper) }
  end
end
