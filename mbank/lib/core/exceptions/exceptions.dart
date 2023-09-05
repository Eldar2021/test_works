sealed class MbankException {}

final class ConnectionException extends MbankException {}

final class ConvertException extends MbankException {}

final class NotFoundException extends MbankException {}

final class ServerException extends MbankException {}

final class UnknownException extends MbankException {}

final class AuthenticationException extends MbankException {}
