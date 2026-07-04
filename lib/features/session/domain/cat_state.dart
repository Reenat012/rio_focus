import 'session_mode.dart';

enum CatState { waiting, sleeping, playing }

extension CatStateFromSessionMode on SessionMode {
  CatState get catState => switch (this) {
    SessionMode.idle => CatState.waiting,
    SessionMode.focus => CatState.sleeping,
    SessionMode.breakTime => CatState.playing,
  };
}