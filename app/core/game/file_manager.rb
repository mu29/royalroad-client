class FileManager
  class << self
    def load(file)
      File.join(File.dirname(File.dirname(File.dirname(
        __FILE__))), 'data', file)
    end
  end
end
