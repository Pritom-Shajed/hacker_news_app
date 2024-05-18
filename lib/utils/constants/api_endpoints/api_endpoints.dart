abstract class ApiEndpoints {

  static String topNews = 'topstories.json';
  static String latestNews = 'newstories.json';
  static String specificItem (int id) => '/item/$id.json';
}