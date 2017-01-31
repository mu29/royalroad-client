require 'json'

class FileManager
  class << self
    def path(file)
      File.join(self.root_dir, 'data', file)
    end

    def root_dir
      self.dirname(__FILE__, 4)
    end

    def dirname(dir, count)
      count == 1 ? File.dirname(dir) : self.dirname(File.dirname(dir), count - 1)
    end
  end
end
