import 'package:flutter_test/flutter_test.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

void main() {
  group('SpaceModel', () {
    const id = 'test_id';
    const location = 'test_location';
    const name = 'test_name';
    const timestamp = 1627849923;
    const photoUrl = 'http://example.com/photo.jpg';

    const spaceModel = SpaceModel(
      id: id,
      location: location,
      name: name,
      timestamp: timestamp,
      photoUrl: photoUrl,
    );

    test('should be a subclass of SpaceEntity', () {
      // Assert
      expect(spaceModel, isA<SpaceEntity>());
    });

    test('fromJson should return a valid model', () {
      // Arrange
      final jsonMap = <String, dynamic>{
        'id': id,
        'location': location,
        'name': name,
        'timestamp': timestamp,
        'photoUrl': photoUrl,
      };

      // Act
      final result = SpaceModel.fromJson(jsonMap);

      // Assert
      expect(result, spaceModel);
    });

    test('toJson should return a valid JSON map', () {
      // Arrange
      final expectedJsonMap = {
        'id': id,
        'location': location,
        'name': name,
        'timestamp': timestamp,
        'photoUrl': photoUrl,
      };

      // Act
      final result = spaceModel.toJson();

      // Assert
      expect(result, expectedJsonMap);
    });

    test('should support null photoUrl', () {
      // Arrange
      const spaceModelWithNullPhotoUrl = SpaceModel(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
      );

      final jsonMap = <String, dynamic>{
        'id': id,
        'location': location,
        'name': name,
        'timestamp': timestamp,
      };

      // Act
      final result = SpaceModel.fromJson(jsonMap);

      // Assert
      expect(result, spaceModelWithNullPhotoUrl);
    });
  });
}
