class TodoSerializer < ActiveModel::Serializer 
    attributes :id, :title, :description, :id_squared

    def id_squared
    index = self.object.id.to_i
    index * index
    end
end