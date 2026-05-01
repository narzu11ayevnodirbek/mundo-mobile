import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';
import 'package:mundo_mobile/core/widgets/coming_soon_widget.dart';
import 'package:mundo_mobile/core/widgets/custom_app_bar.dart';
import 'package:mundo_mobile/core/widgets/press_effect.dart';
import 'package:mundo_mobile/features/home/data/home_data.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/ai_assistant_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/animated_arrow_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/doonyo_pay_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/headline_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/service_card_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/smart_alert_widget.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/travel_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingSoon(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ComingSoonModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final services = HomeData.services;
    final images = HomeData.images;
    final places = HomeData.places;
    final countries = HomeData.countries;
    final prices = HomeData.prices;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(isHome: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineWidget(headlineText: "Xizmatlar", actionText: "Barchasi"),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: services.length,
                        padding: const EdgeInsets.only(right: 50),
                        itemBuilder: (context, index) {
                          final item = services[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: PressEffect(
                              onTap: () => _showComingSoon(context),
                              child: SizedBox(
                                width: 110,
                                child: ServiceCardWidget(
                                  title: item["service"].toString(),
                                  subtitle: item["serviceType"].toString(),
                                  icon: item["icon"] as IconData,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.background.withOpacity(0), AppColors.background],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: const Center(child: AnimatedArrowWidget()),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PressEffect(child: AiAssistantWidget(), onTap: () => _showComingSoon(context)),
                const SizedBox(height: 20),
                PressEffect(child: SmartAlertWidget(), onTap: () => _showComingSoon(context)),
                const SizedBox(height: 20),
                HeadlineWidget(headlineText: "Eng yaxshi takliflar", actionText: "Barchasi"),
                const SizedBox(height: 20),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    cacheExtent: 500,
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return TravelCardWidget(
                        image: images[index],
                        place: places[index],
                        country: countries[index],
                        price: prices[index],
                        onTap: () => _showComingSoon(context),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                PressEffect(child: DoonyoPayWidget(), onTap: () => _showComingSoon(context)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
