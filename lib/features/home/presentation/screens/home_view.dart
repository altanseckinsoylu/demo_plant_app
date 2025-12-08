import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/init/di_container.dart';
import 'package:plant_app/features/home/cubit/home_cubit.dart';
import 'package:plant_app/features/home/data/models/category_model.dart';
import 'package:plant_app/features/home/data/models/question_model.dart';
import 'package:plant_app/features/home/presentation/widgets/bottom_nav.dart';
import 'package:plant_app/features/home/presentation/widgets/category_card.dart';
import 'package:plant_app/features/home/presentation/widgets/home_search_bar.dart';
import 'package:plant_app/features/home/presentation/widgets/premium_banner.dart';
import 'package:plant_app/features/home/presentation/widgets/question_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeCubit>()..getData(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.failure) {
            return Center(
              child: Text(state.errorMessage ?? 'An error occurred'),
            );
          }

          final bool isLoading = state.status == HomeStatus.loading;

          final List<QuestionModel> questions = isLoading
              ? List.generate(
                  3,
                  (index) => QuestionModel(
                    id: 0,
                    title: 'Dummy Title',
                    subtitle: '',
                    imageUri: '',
                    uri: '',
                    order: 0,
                  ),
                )
              : state.questions;

          final List<CategoryModel> categories = isLoading
              ? List.generate(
                  4,
                  (index) => CategoryModel(
                    id: 0,
                    name: 'Dummy',
                    title: 'Category Name',
                    rank: 0,
                  ),
                )
              : state.categories;

          return Skeletonizer(
            enabled: isLoading,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Plant Lover',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Good Afternoon! ⛅',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  centerTitle: false,
                  titleSpacing: 20,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            width: MediaQuery.of(context).size.width,
                            'assets/images/home_images/leaf.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(80),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: HomeSearchField(),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: PremiumBanner()),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: HelperConstants.homeHorizontalCardHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return QuestionCard(question: questions[index]);
                      },
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return CategoryCard(category: categories[index]);
                    }, childCount: categories.length),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.primary,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                icon: Icons.home,
                label: 'Home',
                isSelected: true,
                theme: theme,
              ),
              BottomNavItem(
                icon: Icons.local_hospital_outlined,
                label: 'Diagnose',
                theme: theme,
              ),
              const SizedBox(width: 48),
              BottomNavItem(
                icon: Icons.local_florist_outlined,
                label: 'My Garden',
                theme: theme,
              ),
              BottomNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                theme: theme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
