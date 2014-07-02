module Notes
	module Api
		class Notes < Grape::API
		  version 'v1', using: :header, vendor: 'notes'
		  format :json

      before do
        authenticated?
      end

      namespace :notes do
			  get do
			  	NotesSerializer.new(Note.all())
			  end
        
			  post do
			  	note = Note.create params[:notes][0]
			  	status 201
			  	NotesSerializer.new([note])
			  end

			  get ':id' do
			  	note = Note.find params[:id]
					error!("Not Found", 404)  unless note
			  	NotesSerializer.new([note])
			  end 

			  delete ':id' do
			  	note = Note.find(params[:id])
					error!("Not Found", 404)  unless note
			  	note.destroy()
			  	status 204
			  end
      end
		end
	end
end
