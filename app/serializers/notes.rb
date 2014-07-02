require 'oat/adapters/json_api'

class NotesSerializer < Oat::Serializer
	adapter Oat::Adapters::JsonAPI

	schema do
		type "notes"
		link :self, href: '/notes'
		collection :notes, item, NoteSerializer
  end
end
