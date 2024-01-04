enum ProfileDataField {
  stepTarget,
  cardioPointsTarget,
}

class ProfileDataUpdateEvent {
  final num value;

  final ProfileDataField updatedField;

  const ProfileDataUpdateEvent({
    required this.value,
    required this.updatedField,
  });
}
