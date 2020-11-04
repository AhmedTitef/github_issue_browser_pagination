import 'package:flutter/material.dart';
import 'package:githubissuebrowser/screens/issue_screen.dart';
import 'package:githubissuebrowser/services/issues.dart';
import 'package:githubissuebrowser/services/issues_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_view/pagination_view.dart';

class MainScreen extends StatefulWidget {
  static const id = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GetIssues _getIssues = new GetIssues();
  ScrollController _scrollController = new ScrollController();
  var _pageSize = 10;
  final PagingController<int, Issues> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _getIssues.getIssues(
        _pageSize,
        pageKey,
      );

      final isLastPage = newItems.length == 0;
      // here it keeps checking once it recieves empty so that means there is no other information anymore

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
        print("end");
      } else {
//
        final nextPageKey = pageKey + 1;
        print(nextPageKey);
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Issues Browser"),
      ),
      body: SafeArea(
        child: Center(
            child: RefreshIndicator(
          onRefresh: () {
            return Future.sync(() => _pagingController.refresh());
          },
          child: PagedListView<int, Issues>.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 2,
            ),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Issues>(
                itemBuilder: (context, issue, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IssueScreen(
                                  snapshot: issue,
                                )),
                      );
                    },
                    leading: Text((index + 1).toString()),
                    title: Text("Issue #: " + issue.id.toString()),
                    subtitle: Text("Title: " + issue.title.toString()),
                    trailing: Text("State: " + issue.state.toString()),
                  ),
                  Divider(),
                ],
              );
            }),
          ),
        )

//          child: PaginationView(
//            paginationViewType: PaginationViewType.listView,
//            preloadedItems: [
//              Text("A"),
//            ],
//            onError: (error) {
//              return Center(
//                child: Text("Some error occured"),
//              );
//            },
//            itemBuilder: (BuildContext context, dynamic issue, int index) {
//              return Text("");
//            },
//            pageFetch: (int currentListSize) async {
//              List<Issues> issues = List.generate(10, (index) => Issues());
//              await Future<List<Issues>>.delayed(Duration(seconds: 1));
//              return issues;
//            },
//            onEmpty: Center(
//              child: CircularProgressIndicator(),
//            ),
//          ),
//          child: FutureBuilder(
//            future: getIssues.getIssues(),
//            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//              if (snapshot.hasData) {
//                return ListView.builder(
//                  controller: _scrollController,
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (context, index) {
//                      Issues issue = snapshot.data[index];
//                      return ListTile(
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => IssueScreen(
//                                      snapshot: issue,
//                                    )),
//                          );
//                        },
//                        title: Text("Issue #: " +issue.id.toString()),
//                        subtitle: Text("Title: " + issue.title.toString()),
//                        trailing: Text("State: " + issue.state.toString()),
//                      );
//                    });
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),
            ),
      ),
    );
  }
}
