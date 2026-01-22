db.video.countDocuments({"genre": "Comedy"})

db.video.find({"cast": { "$all": ["Isabelle Huppert", "Pauline Etienne"] }})

db.video.aggregate([
  {
    $group: {
      _id: "$title",
      count: { $sum: 1 },
      docs: { $push: "$_id" }  // Collect the _id values of all documents with this title
    }
  },
  {
    $match: {
      count: { $gt: 1 }
    }
  }
]).forEach(function(doc) {
  // Keep the first document, delete the others
  doc.docs.shift();  // Remove the first document's _id (this will be the one we keep)
  db.video.deleteMany({
    _id: { $in: doc.docs }  // Delete the other documents in the 'docs' array
  });
});

db.video.find({
    viewerRating: 6,
    viewerVotes: {$gt: 20}
},{
    _id: 1,
    title: 1,
    year: 1
})

db.video.find(
{
cast: {
$in : ["Gérard Depardieu","Cécile De France"]
}
},{
title:1,
_id: 0
}
)

