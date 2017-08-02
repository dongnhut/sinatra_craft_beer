class CategorySerializer
  def initialize(category)
    @category = category
  end

  def as_json(*)
    data = {
      id: @category.id,
      name: @category.name,
      # created_at: @category.created_at,
      # updated_at: @category.updated_at
    }
    data[:errors] = @category.errors if @category.errors.any?
    data
  end
end
