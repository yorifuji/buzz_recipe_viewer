import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchHitWidget extends StatelessWidget {
  const SearchHitWidget({
    super.key,
    required this.searchHit,
    this.onTapFavorite,
    this.isFavorite = false,
  });

  final SearchHit searchHit;
  final VoidCallback? onTapFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.network(searchHit.image),
            const SizedBox(height: 8),
          ],
        ),
        _TextInformationWidget(
          searchHit: searchHit,
        ),
      ],
    );
  }
}

class _TextInformationWidget extends StatefulWidget {
  const _TextInformationWidget({required this.searchHit});

  final SearchHit searchHit;

  @override
  State<_TextInformationWidget> createState() => __TextInformationWidgetState();
}

class __TextInformationWidgetState extends State<_TextInformationWidget>
    with AutomaticKeepAliveClientMixin {
  bool _isExpanded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        InkWell(
          onTap: _toggle,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.searchHit.title),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.thumb_up,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '''${NumberFormat("#,###").format(widget.searchHit.likes)} likes''',
                    ),
                    const SizedBox(width: 6),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.trending_up,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '''${NumberFormat("#,###").format(widget.searchHit.views)} views''',
                    ),
                    const SizedBox(width: 6),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      DateFormat('yyyy-MM-dd').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          widget.searchHit.timestamp * 1000,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (_isExpanded)
          InkWell(
            onTap: _toggle,
            child: Column(
              children: [
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Text(widget.searchHit.description),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
      ],
    );
  }

  void _toggle() {
    setState(() => _isExpanded = !_isExpanded);
  }
}
