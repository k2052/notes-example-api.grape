describe "Note" do
	it "should create an note" do
		note = FactoryGirl.create(:note)
		note = Note.find note.id
		note.should be_an_instance_of Note
	end

	it "should destroy an note" do 
		note = FactoryGirl.create(:note)
		note = Note.find note.id
		note.should be_an_instance_of Note
		note_id = note.id
		note.destroy()
		Note.find(note_id).should be_nil
	end
end
