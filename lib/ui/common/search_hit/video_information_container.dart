import 'package:buzz_recipe_viewer/domain/model/search_hit.dart';
import 'package:custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoInformationContainer extends StatefulWidget {
  const VideoInformationContainer({
    required this.searchHit,
    super.key,
    this.forceExpanded = false,
  });

  final SearchHit searchHit;
  final bool forceExpanded;

  @override
  State<VideoInformationContainer> createState() =>
      __TextInformationWidgetState();
}

class __TextInformationWidgetState extends State<VideoInformationContainer>
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.searchHit.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
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
                        if (!widget.forceExpanded)
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(
                                _isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (widget.forceExpanded || _isExpanded)
          InkWell(
            onTap: _toggle,
            child: Column(
              children: [
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomText(
                      widget.searchHit.description,
                      definitions: const [
                        TextDefinition(matcher: UrlMatcher()),
                        TextDefinition(matcher: EmailMatcher()),
                      ],
                      matchStyle: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      onTap: (details) async {
                        final url = Uri.parse(details.actionText);
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ),
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
