class ActiveRecord::Base
  
  def self.serialized_attr_reader(container, *accessors)
    accessors.each do |m|
      class_eval <<-EOS
        def #{m}
          puts "READING #{container}[#{m}]"
          self.#{container} = Hash.new unless self.#{container}.is_a?(Hash)
          self.#{container}['#{m}']
        end
      EOS
    end
  end # reader

  def self.serialized_attr_writer(container, *accessors)
    accessors.each do |m|
      class_eval <<-EOS
        def #{m}=(val) 
          puts "WRITING #{container}[#{m}] v1"  
          self.#{container} = Hash.new unless self.#{container}.is_a?(Hash)
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
