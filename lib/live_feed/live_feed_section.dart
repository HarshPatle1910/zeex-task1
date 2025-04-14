import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class LiveFeedSection extends StatelessWidget {
  const LiveFeedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Live Feed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "View All",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Live Feed Videos
        Row(
          children: [
            Expanded(
              child: LiveFeedCard(
                cameraTitle: "Front Gate Camera",
                streamUrl: "http://13.200.217.220:5000/video_feed",
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LiveFeedCard(
                cameraTitle: "Camera 2 - Parking",
                staticImage: "https://youtu.be/r-xtFbyhcVM?si=L9D8xq485_jQ_ZI0",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LiveFeedCard extends StatelessWidget {
  final String cameraTitle;
  final String? streamUrl;
  final String? staticImage;

  const LiveFeedCard({
    Key? key,
    required this.cameraTitle,
    this.streamUrl,
    this.staticImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isYouTube = _isYouTubeLink(staticImage);

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8.0)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: _buildVideoContent(isYouTube),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cameraTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(bool isYouTube) {
    if (kIsWeb && isYouTube) {
      final videoId = _extractYouTubeVideoId(staticImage!);
      // if (videoId != null) {
      //   final viewType = 'youtube-video-$videoId';
      //
      //   // Register once only
      //   ui.platformViewRegistry.registerViewFactory(
      //     viewType,
      //     (int viewId) =>
      //         html.IFrameElement()
      //           ..src = 'https://www.youtube.com/embed/$videoId'
      //           ..style.border = 'none'
      //           ..allow =
      //               'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
      //           ..allowFullscreen = true,
      //   );
      //
      //   return HtmlElementView(viewType: viewType);
      // }
    }

    if (streamUrl != null) {
      return kIsWeb
          ? Image.network(
            streamUrl!,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Center(child: Text("Stream failed to load (Web)")),
          )
          : Mjpeg(
            stream: streamUrl!,
            isLive: true,
            fit: BoxFit.cover,
            error:
                (context, error, stack) =>
                    const Center(child: Text('Failed to load stream')),
          );
    }

    if (staticImage != null) {
      return Image.network(staticImage!, fit: BoxFit.cover);
    }

    return const Center(child: Text("No stream or image"));
  }

  bool _isYouTubeLink(String? url) {
    if (url == null) return false;
    return url.contains("youtube.com") || url.contains("youtu.be");
  }

  String? _extractYouTubeVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
    } else if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'];
    }
    return null;
  }
}
