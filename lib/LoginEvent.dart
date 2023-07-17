
class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitted extends LoginEvent {
  const FormSubmitted({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

}