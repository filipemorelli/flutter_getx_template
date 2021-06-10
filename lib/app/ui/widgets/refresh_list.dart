import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshList extends StatelessWidget {
  const RefreshList({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  final Widget child;
  final Future<void> Function() onRefresh;

  Widget _buildIOSList() {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        Text('test'),
        // child
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((context, index) {
        //     WordPair wordPair = _data[index];

        //     return _buildListItem(wordPair.asString, context);
        //   }, childCount: _data.length),
        // ),
      ],
    );
  }

  Widget _buildAndroidList() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildIOSList() : _buildAndroidList();
  }
}
