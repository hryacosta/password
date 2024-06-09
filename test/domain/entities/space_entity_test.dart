import 'package:flutter_test/flutter_test.dart';
import 'package:password/domain/entities/space_entity.dart';

void main() {
  group('SpaceEntity', () {
    const id = 'test_id';
    const location = 'test_location';
    const name = 'test_name';
    const timestamp = 1627849923;
    const photoUrl = 'http://example.com/photo.jpg';

    test('should create a valid SpaceEntity', () {
      // Arrange & Act
      const spaceEntity = SpaceEntity(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
        photoUrl: photoUrl,
      );

      // Assert
      expect(spaceEntity.id, id);
      expect(spaceEntity.location, location);
      expect(spaceEntity.name, name);
      expect(spaceEntity.timestamp, timestamp);
      expect(spaceEntity.photoUrl, photoUrl);
    });

    test('props should contain all properties', () {
      // Arrange
      const spaceEntity = SpaceEntity(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
        photoUrl: photoUrl,
      );

      // Act
      final props = spaceEntity.props;

      // Assert
      expect(props, [id, location, name, timestamp, photoUrl]);
    });

    test('should support value equality', () {
      // Arrange
      const spaceEntity1 = SpaceEntity(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
        photoUrl: photoUrl,
      );

      const spaceEntity2 = SpaceEntity(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
        photoUrl: photoUrl,
      );

      // Assert
      expect(spaceEntity1, spaceEntity2);
    });

    test('should support null photoUrl', () {
      // Arrange & Act
      const spaceEntity = SpaceEntity(
        id: id,
        location: location,
        name: name,
        timestamp: timestamp,
      );

      // Assert
      expect(spaceEntity.photoUrl, null);
    });
  });
}
