import 'package:campus_insider/core/constants/constants.dart';
import 'package:campus_insider/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticleByCategory({
    @Query("country") String? countryQuery,
    @Query("category") String? category,
    @Query("apiKey") String? apiKey,
  });

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticleBySource({
    @Query("sources") String? source,
    @Query("apiKey") String? apiKey,
  });

  @GET('/everything')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticleBySearch({
    @Query("q") String? search,
    @Query("apiKey") String? apiKey,
  });
}
