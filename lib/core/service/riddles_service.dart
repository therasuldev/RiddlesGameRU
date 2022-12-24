abstract class RiddlesService {
  dynamic loadRiddles(String category);
  Future<List<Map<String, dynamic>>> getRiddles(String category);
}
