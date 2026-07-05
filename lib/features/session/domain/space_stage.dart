enum SpaceStage { stage1, stage2, stage3 }

extension SpaceStageFromTotalSessions on int {
  SpaceStage get spaceStage {
    if (this >= 10) return SpaceStage.stage3;
    if (this >= 3) return SpaceStage.stage2;

    return SpaceStage.stage1;
  }
}
