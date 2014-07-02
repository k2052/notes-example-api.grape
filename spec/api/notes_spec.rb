describe "Notes" do
	before do
		header "CONTENT_TYPE", "application/json"
	end
	describe "authorized" do
		before do
			header 'X-Token', 'TestKey'
		end

		it "should return notes" do
	    get "/notes"
	    last_response.status.should == 200
	    last_response.body.should == NotesSerializer.new(Note.all()).to_json
		end

		it "should create a note" do
			note = FactoryGirl.build(:note)
			post "/notes", NotesSerializer.new([note]).to_json
		  last_response.status.should == 201
		  JSON.parse(last_response.body)['notes'][0]['title'].should == note.title
		end

		it "should return a note" do
			note = Note.first()
			get "/notes/#{note.id}"
		  last_response.status.should == 200
		  last_response.body.should == NotesSerializer.new([note]).to_json
		end

		it "should destroy a note" do
			note = FactoryGirl.create(:note)
			delete "/notes/#{note.id}"
		  last_response.status.should == 204
		end
	end

	describe "unauthorized" do
		before do
			header 'X-Token', 'BadKey'
		end

		it "should refuse to return notes" do
	    get "/notes"
	    last_response.status.should == 401
		end

		it "should refuse to create a note" do
			note = FactoryGirl.build(:note)
			post "/notes"
	    last_response.status.should == 401
		end

		it "should refuse to return a note" do
			note = Note.first()
			get "/notes/#{note.id}"
	    last_response.status.should == 401
		end

		it "should refuse to destroy a note" do
			note = FactoryGirl.create(:note)
			delete "/notes/#{note.id}"
	    last_response.status.should == 401
		end
	end
end
