import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

Future<List<Blog>> createBlogs() async {
  List<Blog> blogs = [];
  final url = 'https://blog.playstation.com';
  final response = await http.get(Uri.parse(url));
  final document = parser.parse(response.body);

  final articleElements = document.querySelectorAll('article');
  List<String> imageUrls = [];
  List<String> titles = [];
  List<String> blogUrls = [];
  List<String> publicationDates = [];

  for (var articleElement in articleElements) {
    final featuredAssetElement =
        articleElement.querySelector('.post-card__featured-asset');
    if (featuredAssetElement != null) {
      final imageElement = featuredAssetElement.querySelector('img');
      if (imageElement != null) {
        final imageUrl = imageElement.attributes['src'];
        final title = imageElement.attributes['alt'];
        if (imageUrl != null) {
          imageUrls.add(imageUrl);
        }
        if (title != null && !titles.contains(title)) {
          titles.add(title);
        }
      }
    }
    final dateElement = articleElement.querySelector('.post-card__meta-date');
    if (dateElement != null) {
      final publicationDate =
          dateElement.text.replaceAll('Date published:', '').trim();
      publicationDates.add(publicationDate);
    }
    final blogUrlElements = articleElement.querySelectorAll('a');
    for (var blogUrlElement in blogUrlElements) {
      final blogUrl = blogUrlElement.attributes['href'];
      if (blogUrl != null) {
        if (!blogUrls.contains(blogUrl) && !blogUrl.contains('author')) {
          blogUrls.add(blogUrl);
        }
      }
    }
  }
  for (var i = 0; i < 20; i++) {
    blogs.add(Blog(
        title: titles[i],
        imageUrl: imageUrls[i],
        date: publicationDates[i],
        blogUrl: blogUrls[i]));
  }
  return blogs;
}

class Blog {
  final String title;
  final String imageUrl;
  final String date;
  final String blogUrl;

  Blog({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.blogUrl,
  });
}

List<Blog> sortBlogsByDate(List<Blog> blogs) {
  blogs.sort((a, b) => b.date.compareTo(a.date));
  return blogs;
}

class Article {
  final String title;
  final String imageUrl;
  final String date;
  final String text;

  Article({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.text,
  });
}
