require 'oat/adapters/json_api'

class NoteSerializer < Oat::Serializer
  adapter Oat::Adapters::JsonAPI

  schema do
    type "notes"
    property :id, item.id
    property :title, item.title
  end
end
