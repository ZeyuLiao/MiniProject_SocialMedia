package neu.edu.dao;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import org.bson.Document;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class LikeDaoMongoDB {

    private final MongoCollection<Document> usersCollection;

    public LikeDaoMongoDB(MongoClient mongo) {
        this.usersCollection = mongo.getDatabase("testdb").getCollection("likes");
    }
    public void addLike(String username, String likeId) {
        usersCollection.updateOne(
                Filters.eq("username", username),
                Updates.combine(
                        Updates.set("username", username),
                        Updates.addToSet("likes", new Document("like_id", likeId))
                ),
                new UpdateOptions().upsert(true)
        );
    }

    public void unlike(String username, String likeId) {
        usersCollection.updateOne(
                Filters.eq("username", username),
                Updates.pull("likes", new Document("like_id", likeId))
        );
    }

    public Set<String> getAllLikes(String username) {
        Document query = new Document("username", username);
        Document projection = new Document("likes.like_id", 1).append("_id", 0);
        MongoCursor<Document> cursor = usersCollection.find(query).projection(projection).iterator();

        Set<String> likes = new HashSet<>();
        while (cursor.hasNext()) {
            Document document = cursor.next();
            List<Document> likesList = (List<Document>) document.get("likes");
            for (Document like : likesList) {
                String likeId = like.getString("like_id");
                likes.add(likeId);
            }
        }

        cursor.close();
        return likes;
    }
}
