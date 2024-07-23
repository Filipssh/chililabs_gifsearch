import 'package:chililabs_gifsearch/core/models/giphy_model.dart';
import 'package:chililabs_gifsearch/core/services/giphy_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() async {
  await dotenv.load(fileName: ".env");

  late GiphyService giphyService;
  late MockHTTPClient mockHTTPClient;
  final String apiKey = dotenv.env['GIPHY_API_KEY'] ?? '';

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    giphyService = GiphyService(mockHTTPClient);
  });

  group('GiphyService - ', () {
    group('fetchGifs function', () {
      test(
        'given GiphyService class when fetchGifs function is called and status code is 200 then a GiphyModel should be returned',
            () async {
          // Arrange
          when(
                () => mockHTTPClient.get(
              Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&offset=0&limit=25'),
            ),
          ).thenAnswer((invocation) async {
            return Response('''
            {
              "data": [
                {
                  "id": "3d1cLKJPMoCZABpcSH",
                  "url": "https://giphy.com/gifs/mashable-3d1cLKJPMoCZABpcSH",
                  "images": {
                    "fixed_width_downsampled": {
                      "height": "200",
                      "width": "200",
                      "url": "https://media4.giphy.com/media/3d1cLKJPMoCZABpcSH/200w_d.gif?cid=ced051c08mipot9f5u26z3vyyo2x2d3kv0g2xg141x47l0i7&ep=v1_gifs_trending&rid=200w_d.gif&ct=g"
                    }
                  }
                }
              ]
            }
            ''', 200);
          });
          // Act
          final model = await giphyService.fetchGifs();
          // Assert
          expect(model, isA<GiphyModel>());
        },
      );

      test(
        'given GiphyService class when fetchGifs function is called and status code is not 200 then an exception should be thrown',
            () async {
          // arrange
          when(
                () => mockHTTPClient.get(
              Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&offset=0&limit=25'),
            ),
          ).thenAnswer((invocation) async => Response('{}', 500));
          // act
          final model = giphyService.fetchGifs();
          // assert
          expect(model, throwsException);
        },
      );
    });
  });
}