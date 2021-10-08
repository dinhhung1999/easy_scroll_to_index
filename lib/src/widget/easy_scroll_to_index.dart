


import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class EasyScrollToIndex extends StatefulWidget {
  static const path = 'EasyScrollToIndex';

  final double width;
  final double height;
  final Axis? scrollDirection ;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final bool? addAutomaticKeepAlives;
  final Duration? duration;
  final ScrollToIndexController? controller;
  const EasyScrollToIndex({Key? key, this.addAutomaticKeepAlives, required this.width, required this.height, required this.itemCount, required this.itemBuilder, this.scrollDirection,this.duration, this.controller}) : super(key: key);

  @override
  _EasyScrollToIndexState createState() => _EasyScrollToIndexState();
}


class _EasyScrollToIndexState extends State<EasyScrollToIndex> {
  static const TAG = 'EasyScrollToIndex';
  final ScrollController _scrollController = ScrollController();

  easyScrollToIndex({required int index}){
    if(index>widget.itemCount) return;
    if(widget.scrollDirection==null) {
      _scrollController.animateTo(index * widget.height.toDouble(),
          duration: widget.duration??const Duration(milliseconds: 1000),
          curve: Curves.linear);
    } else if(widget.scrollDirection == Axis.horizontal) {
      _scrollController.animateTo(index * widget.width.toDouble(),
          duration: widget.duration??const Duration(milliseconds: 1000),
          curve: Curves.linear);
    }
  }
  @override
  void initState() {
    super.initState();
    setController();
  }

  @override
  void didUpdateWidget(covariant EasyScrollToIndex oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      setController();
    }
  }
  void setController() {
    widget.controller?.setState(this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives??false ,
            scrollDirection: widget.scrollDirection??Axis.vertical,
            controller: _scrollController,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder
        ),
      )
    );

  }
}

class ScrollToIndexController {
  _EasyScrollToIndexState? _scrollToIndexState;

  void easyScrollToIndex(int index) {
    _scrollToIndexState!.easyScrollToIndex(index: index);
  }

  void setState(_EasyScrollToIndexState state) {
    _scrollToIndexState = state;
  }

}
