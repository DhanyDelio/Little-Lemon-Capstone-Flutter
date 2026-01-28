class ProfileDashboard {
  final String email;
  final String fullname;

  ProfileDashboard({required this.email, required this.fullname});

  factory ProfileDashboard.fromMap(Map<String, dynamic> data) {
    return ProfileDashboard(
      email: data['email'] ?? '',
      fullname: data['fullname'] ?? '',
    );
  }
}
