import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../services/psblog.dart';
import '../services/data.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool psBlog = false;
  late List currentList = [];
  late List<Blog> blogs = [];
  void officialOrBlog(bool x) {
    if (x == true) {
      loadBlogs(createBlogs());
    } else {
      currentList = news;
    }
  }

  final ScrollController _scrollController = ScrollController();
  bool _showRow = true;

  @override
  void initState() {
    super.initState();
    officialOrBlog(psBlog);

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && _showRow) {
        setState(() {
          _showRow = false;
        });
      } else if (_scrollController.offset <= 0 && !_showRow) {
        setState(() {
          _showRow = true;
        });
      }
    });
  }

  Future<void> loadBlogs(Future<List<Blog>> fetchedBlogs) async {
    try {
      blogs = await fetchedBlogs;
      //blogs = sortBlogsByDate(blogs);
      setState(() {
        currentList = blogs;
      });
    } catch (e) {
      print('Can\'t load blog data');
    }
  }

  void openBlogUrl(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogScreen(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Explore')),
      body: Column(
        children: [
          AnimatedOpacity(
            opacity: _showRow ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  child: Text('Official News',
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    psBlog = false;
                    officialOrBlog(psBlog);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (psBlog == false) {
                          return Colors.black38;
                        }
                        return Colors.black12;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  child: Text(
                    'PS Blog',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    psBlog = true;
                    officialOrBlog(psBlog);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (psBlog == true) {
                          return Colors.black38;
                        }
                        return Colors.black12;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              controller: _scrollController,
              crossAxisCount: 1,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.all(16.0),
              children: currentList.map((card) {
                if (psBlog) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        openBlogUrl(card.blogUrl);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/other/psblog.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              Text('PlayStation.Blog\n${card.date}',
                                  style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                          if (card.imageUrl ==
                              'https://blog.playstation.com/content/themes/playstation-2018/images/placeholder.svg')
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 350,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/other/psblog.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ))
                          else
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 350,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      card.imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              card.title,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/other/pslogo.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            Text(
                              '${card.date}',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Image.network(
                            card.imageUrl,
                            height: 500,
                            width: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            card.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            card.text,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogScreen extends StatelessWidget {
  final String url;

  const BlogScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}
