class Hash
  # Hash Key String -> Symbol
  # http://stackoverflow.com/questions/800122/best-way-to-convert-strings-to-symbols-in-hash
  def self.symbolize(obj)
      return obj.inject({}){|memo,(k,v)| memo[k.to_sym] =  symbolize(v); memo} if obj.is_a?(Hash)
      return obj.inject([]){|memo,v    | memo           << symbolize(v); memo} if obj.is_a?(Array)
      return obj
  end
end