import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/session_mode.dart';
import '../domain/session_status.dart';
import 'session_state.dart';

class SessionController extends Notifier<SessionState> {
  @override
  SessionState build() {
    return const SessionState(
      mode: SessionMode.idle,
      status: SessionStatus.stopped,
      startedAt: null,
      endsAt: null,
      pausedRemaining: null,
      completedSessionsToday: 0,
      totalCompletedSessions: 0,
      soundEnabled: true,
    );
  }

  void startFocus() {
    state = SessionState(
      mode: SessionMode.focus,
      status: SessionStatus.running,
      startedAt: null,
      endsAt: null,
      pausedRemaining: null,
      completedSessionsToday: state.completedSessionsToday,
      totalCompletedSessions: state.totalCompletedSessions,
      soundEnabled: state.soundEnabled,
    );
  }
}

final sessionControllerProvider =
    NotifierProvider<SessionController, SessionState>(SessionController.new);
