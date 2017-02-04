class Object
  def map_instance_variables(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def presence?
    !nil?
  end
end
