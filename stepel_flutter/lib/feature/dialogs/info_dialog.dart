import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/app/settings.dart';

showInfoDialog(BuildContext context) {
  const Widget dialog = InfoDialog();

  showDialog(
    context: context,
    builder: (BuildContext context) => dialog,
  );
}

class InfoDialog extends StatefulWidget {
  const InfoDialog({super.key});

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  final _pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  children: const [InfoCard1(), InfoCard2()],
                  onPageChanged: (pageIndex) => setState(
                    () {
                      currentPageIndex = pageIndex;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              NextButton(pageController: _pageController, currentPageIndex: currentPageIndex)
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;

  const NextButton({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });

  void moveToNextPage(BuildContext context) {
    currentPageIndex == 1
        ? Navigator.pop(context)
        : pageController.nextPage(
            duration: Settings.welcomePageCardListAnamationDuration,
            curve: Settings.welcomePageCardListCurve,
          );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => moveToNextPage(context),
      child: Text(
        currentPageIndex == 1
            ? context.localization.infoPageDoneButtonText
            : context.localization.infoPageNextButtonText,
      ),
    );
  }
}

class InfoCard1 extends StatelessWidget {
  const InfoCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Отслеживайте свою нагрузку со Stepel',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 25,
        ),
        SvgPicture.asset(
          'assets/images/heart.svg',
          width: 22,
          height: 22,
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Баллы кардиотренировок',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          'Чтобы заработать баллы, больше двигайтесь',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 25,
        ),
        SvgPicture.asset(
          'assets/images/sprint.svg',
          width: 22,
          height: 22,
          colorFilter: const ColorFilter.mode(Color.fromARGB(255, 2, 173, 102), BlendMode.srcIn),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Шаги', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 3,
        ),
        Text(
          'Чтобы достичь цели, находитесь в движении',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('В приложении Stepel не только подсчитываются шаги, но и начисляются баллы кардиотренировок',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
      ],
    );
  }
}

class InfoCard2 extends StatelessWidget {
  const InfoCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Как зарабатывать баллы кардиотренировок',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        SvgPicture.asset(
          'assets/images/heart.svg',
          width: 45,
          height: 45,
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
        const Text(
          'Получайте баллы кардиотренировок за любую активность, например ходьбу или езду на велосипеде.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
