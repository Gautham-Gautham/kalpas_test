import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_test/Features/News/Repository/news_repository.dart';

import '../../../Models/news_model.dart';

final newsDataProvider = FutureProvider.autoDispose<NewsModel?>(
  (ref) {
    return ref.watch(newsControllerProvider).fetchData();
  },
);

final newsControllerProvider = Provider(
  (ref) {
    final repository = NewsRepository();
    return NewsController(newsRepository: repository);
  },
);

class NewsController {
  final NewsRepository _newsRepository;
  NewsController({required NewsRepository newsRepository})
      : _newsRepository = newsRepository;

  Future<NewsModel?> fetchData() {
    return _newsRepository.fetchData();
  }
}
