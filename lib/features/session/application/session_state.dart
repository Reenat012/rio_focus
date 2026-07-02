import '../domain/session_mode.dart';
import '../domain/session_status.dart';

class SessionState {
  const SessionState({
    required this.mode,
    required this.status,
    required this.startedAt,
    required this.endsAt,
    required this.pausedRemaining,
    required this.completedSessionsToday,
    required this.totalCompletedSessions,
    required this.soundEnabled,
  });

  final SessionMode mode;
  final SessionStatus status;

  final DateTime? startedAt;
  final DateTime? endsAt;
  final Duration? pausedRemaining;

  final int completedSessionsToday;
  final int totalCompletedSessions;

  final bool soundEnabled;
}
