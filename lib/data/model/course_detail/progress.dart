class Progress{
  num? watchPercentage;
  num? totalSpentTime;
  num? totalDuration;

  Progress({
    this.watchPercentage,
    this.totalSpentTime,
    this.totalDuration,
  });

  factory Progress.fromJson(Map<String, Object?> json) => Progress(
    watchPercentage: json['watch_percentage'] as num?,
    totalSpentTime: json['total_spent_time'] as num?,
    totalDuration: json['total_duration'] as num?,
  );

  Map<String, Object?> toJson() => {
    'watch_percentage': watchPercentage,
    'total_spent_time': totalSpentTime,
    'total_duration': totalDuration
  };
}