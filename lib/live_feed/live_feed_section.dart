import 'package:flutter/material.dart';

class LiveFeedSection extends StatelessWidget {
  const LiveFeedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Live Feed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to detailed live feed page
                },
                child: Text("View All", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Live Feed Videos
          Row(
            children: [
              Expanded(
                child: LiveFeedCard(
                  cameraTitle: "Camera 1 - Main Entrance",
                  imageUrl:
                      "https://www.shutterstock.com/image-photo/face-detection-recognition-citizens-people-600nw-1791158417.jpg",
                  onTap: () {
                    // TODO: Implement full-screen feed viewer
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: LiveFeedCard(
                  cameraTitle: "Camera 2 - Parking",
                  imageUrl:
                      "https://www.clairvoyant.ai/hubfs/Train%20the%20Model.jpeg",
                  onTap: () {
                    // TODO: Implement full-screen feed viewer
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LiveFeedCard extends StatelessWidget {
  final String cameraTitle;
  final String imageUrl;
  final VoidCallback onTap;

  const LiveFeedCard({
    Key? key,
    required this.cameraTitle,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8.0)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Camera Image
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Camera Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cameraTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
