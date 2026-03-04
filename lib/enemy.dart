import 'package:freezed_annotation/freezed_annotation.dart';

part 'enemy.freezed.dart';

@freezed
sealed class Enemy with _$Enemy {
  const factory Enemy({required String name}) = _Enemy;
}
