import 'package:equatable/equatable.dart';

/// {@template sys}
/// Sys description
/// {@endtemplate}
class Sys extends Equatable {
  /// {@macro sys}
  const Sys({required this.pod});

  /// Creates a Sys from Json map
  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json['pod'] as String,
      );

  /// A description for pod
  final String pod;

  /// Creates a copy of the current Sys with property changes
  Sys copyWith({String? pod}) {
    return Sys(pod: pod ?? this.pod);
  }

  @override
  List<Object?> get props => [pod];

  /// Creates a Json map from a Sys
  Map<String, dynamic> toJson() => <String, dynamic>{'pod': pod};
}
