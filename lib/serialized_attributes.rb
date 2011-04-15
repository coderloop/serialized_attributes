class ActiveRecord::Base
  
  def self.serialized_attr_reader(container, *accessors)
    accessors.each do |m|
      class_eval <<-EOS
        def #{m}  
          self.#{container}['#{m}']
        end
      EOS
    end
  end # reader

  def self.serialized_attr_writer(container, *accessors)
    accessors.each do |m|
      class_eval <<-EOS
        def #{m}=(val) 
          self.#{container}['#{m}'] = val
        end
      EOS
    end
  end # writer

  def self.serialized_attr_accessor(container, *accessors)
    self.serialized_attr_reader(container, *accessors)
    self.serialized_attr_writer(container, *accessors)
  end

end
