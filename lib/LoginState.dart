class LoginState {
  const LoginState({
    this.isValid = false,
    this.status = "In Progress",
  });
  final bool isValid;
  final String status;

LoginState copyWith({
    bool? isValid,
    String? status,
  }) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}