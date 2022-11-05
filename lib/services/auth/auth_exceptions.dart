
// Login exception
class UserNotFoundAuthException implements Exception {}
class WrongPasswordFoundAuthException implements Exception {}

// Register exception
class WeakPasswordAuthException implements Exception {}
class EmailAlreadyInUseAuthException implements Exception {}
class InvalidEmailAuthException implements Exception {}

//Generic exceptions

class GenericAuthException implements Exception {}
class UserNotLoggedInAuthException implements Exception {}
