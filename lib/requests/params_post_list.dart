import 'package:flutter_wordpress/constants.dart';

class ParamsPostList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final String afterDate;
  final String beforeDate;
  final List<int> includeAuthorIDs;
  final List<int> excludeAuthorIDs;
  final List<int> includePostIDs;
  final List<int> excludePostIDs;
  final int offset;
  final Order order;
  final PostsOrderBy orderBy;
  final String slug;
  final PostStatus postStatus;
  final List<int> includeCategories;
  final List<int> excludeCategories;
  final List<int> includeTags;
  final List<int> excludeTags;
  final bool sticky;

  ParamsPostList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.afterDate = '',
    this.beforeDate = '',
    this.includeAuthorIDs,
    this.excludeAuthorIDs,
    this.includePostIDs,
    this.excludePostIDs,
    this.offset,
    this.order = Order.desc,
    this.orderBy = PostsOrderBy.date,
    this.slug = '',
    this.postStatus = PostStatus.publish,
    this.includeCategories,
    this.excludeCategories,
    this.includeTags,
    this.excludeTags,
    this.sticky,
  });

  Map<String, String> toMap() {
    return {
      'context': '${enumStringToName(this.context.toString())}',
      'page': '${this.pageNum}',
      'per_page': '${this.perPage}',
      'search': '${this.searchQuery}',
      'after': '${this.afterDate}',
      'before': '${this.searchQuery == null ? '' : this.searchQuery}',
      'author': '${listToUrlString(this.includeAuthorIDs)}',
      'author_exclude': '${listToUrlString(this.excludeAuthorIDs)}',
      'include': '${listToUrlString(includePostIDs)}',
      'exclude': '${listToUrlString(excludePostIDs)}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'slug': '${this.slug}',
      'status': '${enumStringToName(this.postStatus.toString())}',
      'categories': '${listToUrlString(includeCategories)}',
      'categories_exclude': '${listToUrlString(excludeCategories)}',
      'tags': '${listToUrlString(includeTags)}',
      'tags_exclude': '${listToUrlString(excludeTags)}',
      'sticky': '${this.sticky == null ? '' : this.sticky}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }

}