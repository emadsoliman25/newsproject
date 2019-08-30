class Post {
  String id, title, content, dataWritten, featuredImage;
  int votesUp, votesDown,userId, categoryId;
  List<int> votersUp, votersDown;


  Post({this.id, this.title, this.content, this.dataWritten, this.featuredImage,
      this.votesUp, this.votesDown, this.votersUp, this.votersDown, this.userId,
      this.categoryId});

}
