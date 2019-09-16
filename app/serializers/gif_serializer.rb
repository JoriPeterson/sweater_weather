class GifSerializer
  # include FastJsonapi::ObjectSerializer
  # attributes :id, :url, :day, :summary
  def initialize(data)
    @data = data
  end
end
