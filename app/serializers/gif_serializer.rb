class GifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :day, :summary, :url
end
