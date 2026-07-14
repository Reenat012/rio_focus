import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/session_mode.dart';
import '../domain/session_status.dart';
import 'session_state.dart';

class SessionController extends Notifier<SessionState> {
  Timer? _ticker;

  @override
  SessionState build() {
    ref.onDispose(() {
      _ticker?.cancel();
    });

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
    final startedAt = DateTime.now();
    final endsAt = startedAt.add(const Duration(minutes: 25));

    _ticker?.cancel();

    state = SessionState(
      mode: SessionMode.focus,
      status: SessionStatus.running,
      startedAt: startedAt,
      endsAt: endsAt,
      pausedRemaining: null,
      completedSessionsToday: state.completedSessionsToday,
      totalCompletedSessions: state.totalCompletedSessions,
      soundEnabled: state.soundEnabled,
    );

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      _refreshRunningState();
    });
  }

  void _refreshRunningState() {
    if (state.status != SessionStatus.running || state.endsAt == null) {
      return;
    }

    state = SessionState(
      mode: state.mode,
      status: state.status,
      startedAt: state.startedAt,
      endsAt: state.endsAt,
      pausedRemaining: state.pausedRemaining,
      completedSessionsToday: state.completedSessionsToday,
      totalCompletedSessions: state.totalCompletedSessions,
      soundEnabled: state.soundEnabled,
    );
  }
}

final sessionControllerProvider =
    NotifierProvider<SessionController, SessionState>(SessionController.new);
