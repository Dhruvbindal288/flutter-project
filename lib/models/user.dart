class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final String username;
  final List follower;
  final List following;

  const User(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.bio,
      required this.username,
      required this.following,
      required this.follower});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'follower': [],
        'following': [],
        'photourl': photoUrl
      };
}
