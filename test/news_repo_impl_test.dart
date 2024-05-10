import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_flutter_data_newsapi/entity/news_response_entity.dart';
import 'package:news_flutter_data_newsapi/news_repo_impl.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';

import 'api_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsApiRepoImpl>()])
void main() {
  late MockApiService mockApiService;
  Map<String, dynamic> response = {
    "status": "ok",
    "totalResults": 9154,
    "articles": [
      {
        "source": {"id": null, "name": "CNBC"},
        "author": null,
        "title": "Chinese EV maker Nio to launch its lower-priced brand Onvo on May 15",
        "description": "Chinese electric car company Nio said Thursday it will launch its lower-priced brand called Onvo on May 15.",
        "url": "https://www.cnbc.com/2024/05/09/chinese-ev-maker-nio-to-launch-its-lower-priced-brand-onvo-on-may-15.html",
        "urlToImage": null,
        "publishedAt": "2024-05-09T02:51:49Z",
        "content":
            "BEIJING Chinese electric car company Nio said Thursday it will launch its lower-priced brand called Onvo on May 15.\r\nThe announcement comes amid a price war in China's highly competitive electric car… [+820 chars]"
      },
      {
        "source": {"id": "the-times-of-india", "name": "The Times of India"},
        "author": "Bloomberg",
        "title": "Elon Musk’s xAI nears funding at \$18 billion value soon as this week",
        "description":
            "The size of the round hasn’t been finalised, the people said, asking not to be identified as the information isn’t public. The maker of AI chatbot assistant Grok was set to raise \$6 billion in the round, whose participants include Sequoia Capital, Bloomberg N…",
        "url": "https://economictimes.indiatimes.com/tech/funding/elon-musks-xai-nears-funding-at-18-billion-value-soon-as-this-week/articleshow/109963893.cms",
        "urlToImage": "https://img.etimg.com/thumb/msid-109963888,width-1200,height-630,imgsize-93376,overlay-ettech/photo.jpg",
        "publishedAt": "2024-05-09T02:23:59Z",
        "content":
            "Elon Musks artificial intelligence startup X.AI Corp. is set to close its funding round at a valuation of about \$18 billion as soon as this week, according to people familiar with the matter.The size… [+1413 chars]"
      },
      {
        "source": {"id": null, "name": "Ducttapemarketing.com"},
        "author": "John Jantsch",
        "title": "How to Win The Consumer Boredom-Span: The Key to Cutting Through Clutter",
        "description":
            "How to Win The Consumer Boredom-Span: The Key to Cutting Through Clutter written by John Jantsch read more at Duct Tape Marketing\nThe Duct Tape Marketing Podcast with John Jantsch In this episode of the Duct Tape Marketing Podcast, I interviewed Alan Dibb. Th…",
        "url": "https://ducttapemarketing.com/win-consumer-boredom-span-lean-marketing/",
        "urlToImage": "https://i0.wp.com/ducttapemarketing.com/wp-content/uploads/2024/05/magnet-me-LDcC7aCWVlo-unsplash-scaled.jpg?fit=2558%2C1706&ssl=1",
        "publishedAt": "2024-05-09T01:53:50Z",
        "content":
            "Speaker 1 (00:00): I was like, I found it. I found it. This is what I've been looking for. I can honestly say it has genuinely changed the way I run my business. It's changed the results that I'm see… [+22550 chars]"
      },
    ],
  };

  setUpAll(() {
    mockApiService = MockApiService();
  });

  test("News Repo get news api test", () {
    NewsResponseEntity responseEntity = NewsResponseEntity.fromJson(response);

    when(mockApiService.everything(
      q: anyNamed('q'),
      from: anyNamed('from'),
      sortBy: anyNamed('sortBy'),
      apiKey: anyNamed('apiKey'),
    )).thenAnswer((realInvocation) => Future(() => responseEntity));
    clearInteractions(mockApiService);
    NewsRepo newsRepo = NewsApiRepoImpl(apiKey: "", apiService: mockApiService);
    newsRepo.getNews();
    verify(mockApiService.everything(
      q: anyNamed('q'),
      from: anyNamed('from'),
      sortBy: anyNamed('sortBy'),
      apiKey: anyNamed('apiKey'),
    )).called(1);
  });

  group("News entity parse test", () {
    test("News title parsing test", () {
      NewsResponseEntity responseEntity = NewsResponseEntity.fromJson(response);
      String? expected = "";
      expect(responseEntity.articles.first.title, "Chinese EV maker Nio to launch its lower-priced brand Onvo on May 15");
      expected = response['articles'][0]['title'];
      debugPrint("title : $expected");
      expect(responseEntity.articles.first.title, expected);
      expected = response['articles'][1]['title'];
      debugPrint("title : $expected");
      expect(responseEntity.articles[1].title, expected);
      expected = response['articles'][2]['title'];
      debugPrint("title : $expected");
      expect(responseEntity.articles[2].title, expected);
    });

    test("News image url parse test", () {
      NewsResponseEntity responseEntity = NewsResponseEntity.fromJson(response);
      String? expected = "";
      expected = response['articles'][0]['urlToImage'];
      debugPrint("imageUrl : $expected");
      expect(responseEntity.articles[0].urlToImage, expected);

      expected = response['articles'][1]['urlToImage'];
      debugPrint("imageUrl : $expected");
      expect(responseEntity.articles[1].urlToImage, "https://img.etimg.com/thumb/msid-109963888,width-1200,height-630,imgsize-93376,overlay-ettech/photo.jpg");
      expect(responseEntity.articles[1].urlToImage, expected);

      expected = response['articles'][2]['urlToImage'];
      debugPrint("imageUrl : $expected");
      expect(responseEntity.articles[2].urlToImage, expected);
    });

    test("Api testing", () async {
      NewsResponseEntity responseEntity = NewsResponseEntity.fromJson(response);

      when(mockApiService.everything(
        q: anyNamed('q'),
        from: anyNamed('from'),
        sortBy: anyNamed('sortBy'),
        apiKey: anyNamed('apiKey'),
      )).thenAnswer((realInvocation) => Future(() => responseEntity));
      NewsApiRepoImpl(apiKey: '', apiService: mockApiService);
      NewsResponseEntity? apiResponse = await mockApiService.everything(q: '', from: '', sortBy: '', apiKey: '');
      debugPrint(apiResponse.articles.first.title);
    });
  });
}
