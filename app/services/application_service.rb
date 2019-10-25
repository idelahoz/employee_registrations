class ApplicationService
  def self.call(*args, &block)
    result = new(*args, &block).call
    result
  end
end