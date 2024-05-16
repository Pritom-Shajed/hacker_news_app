abstract class ApiEndpoints {

  static String topNews = 'topstories.json';
  static String latestNews = 'newstories.json';
  static String specificNews (int id) => '/item/$id.json';
}