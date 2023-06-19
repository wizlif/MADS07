import 'package:equatable/equatable.dart';

/// {@template clouds}
/// Clouds description
/// {@endtemplate}
class Clouds extends Equatable {
  /// {@macro clouds}
  const Clouds({required this.all});

  /// Creates a Clouds from Json map
  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: (json['all'] as num).toInt(),
      );

  /// A description for all
  final int all;

  /// Creates a copy of the current Clouds with property changes
  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  @override
  List<Object?> get props => [all];

  /// Creates a Json map from a Clouds
  Map<String, dynamic> toJson() => <String, dynamic>{'all': all};
}
