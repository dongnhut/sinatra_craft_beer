module Categories
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :name, :code

    # def code
    #   'Ok'
    # end
  end

  class ListBeerSerializer < ActiveModel::Serializer
    attributes :id, :name, :category_id
  end
end
