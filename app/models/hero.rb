class Hero < Unit
  def self.paramify_json json
    json = super(json)
    json.each_with_index do |_, i|
      json[i][:num_ooa] = json[i].delete(:ooa) ? 1 : 0
    end
    json
  end
end
  