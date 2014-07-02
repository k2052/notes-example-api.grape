uri = ENV['MONGOHQ_URL'] || ENV['MONGOLAB_URI'] || ENV['MONGODB_URI'] || ENV['MONGO_URL'] || "mongodb://localhost:27017/Notes_#{Notes.env}"

MongoMapper.setup({"#{Notes.env}" => {'uri' => uri}}, Notes.env)
