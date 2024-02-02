import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatelessWidget {
  const NestedScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverCustomAppBar(),
        SliverStickyHeader(),
        SliverBody(),
      ],
    );
  }
}

class SliverCustomAppBar extends StatelessWidget {
  const SliverCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.yellow,
      ),
    );
  }
}

class SliverBody extends StatelessWidget {
  const SliverBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (_, index) {
        return Container(
          color: Colors.blue,
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
        );
      },
      itemCount: 10,
    );
  }
}

class SliverStickyHeader extends StatelessWidget {
  const SliverStickyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MyPersistentHeader(),
      pinned: true,
    );
  }
}

class MyPersistentHeader extends SliverPersistentHeaderDelegate {
  Color color = Colors.yellow;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset >= 100) {
      color = Colors.transparent;
    } else {
      color = Colors.yellow;
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: color,
              width: double.infinity,
              height: 75,
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.red,
              width: 200,
              height: 100,
              alignment: Alignment.center,
              child: const Text(
                "Title",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150.0; // Tinggi maksimum widget saat tidak di-scroll

  @override
  double get minExtent => 150.0; // Tinggi minimum widget saat di-scroll

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
