abstract class IRiddlesRepository {
  Future<List<Map<String, dynamic>>> loadRiddles(String category);
  Future<List<Map<String, dynamic>>> getRiddles(String category);
}
