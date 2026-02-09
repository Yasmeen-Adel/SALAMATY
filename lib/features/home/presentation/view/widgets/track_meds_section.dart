import 'package:flutter/material.dart';

class TrackMedsSection extends StatefulWidget {
  const TrackMedsSection({Key? key}) : super(key: key);

  @override
  State<TrackMedsSection> createState() => _TrackMedsSectionState();
}

class _TrackMedsSectionState extends State<TrackMedsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/middle_home_screen.png',
    'assets/images/middle_home_screen.png',
    'assets/images/middle_home_screen.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: 165,
          width: screenWidth,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Health Tips!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Drink enough water when \ntaking medications',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'See Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? const Color(0xFF1E40AF)
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
