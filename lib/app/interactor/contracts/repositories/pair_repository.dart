abstract class IPairRepository<T> {
  Future<List<T>> getPairs(String codeIn);
}
