import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_example/main.dart';
import 'package:yaru_example/view/color_disk.dart';
import 'package:yaru_example/view/colors_view.dart';
import 'package:yaru_example/view/controls_view.dart';
import 'package:yaru_example/view/fonts_view.dart';
import 'package:yaru_example/view/inputs_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState();
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Yay! $_counter ❤️ for Yaru')));
    });
  }

  final textController = TextEditingController(
    text:
        'My code fails, I do not know why.\nMy code works, I do not know why.\nText in other scripts: Tamaziɣt Taqbaylit, 中文(简体), Čeština, Беларуская, Ελληνικά, עברית, Русский, བོད་ཡིག, Norsk bokmål.',
  );

  int _selectedIndex = 0;
  final List<Widget> _views = [
    const FontsView(),
    const ControlsView(),
    InputsView(),
    const ColorsView()
  ];

  @override
  Widget build(BuildContext context) {
    final theme = YaruTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const CircleBorder(),
              ),
              onPressed: () => AppTheme.apply(
                context,
                themeMode: theme.themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light,
              ),
              child: Icon(
                theme.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<Color>(
            onSelected: (value) {},
            child: SizedBox(
              width: 40,
              child: Icon(
                Icons.color_lens,
                color: Theme.of(context).primaryColor,
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => AppTheme.apply(context, highContrast: true),
                  child: ColorDisk(
                    color: theme.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    selected: theme.highContrast == true,
                    onPressed: () {},
                  ),
                ),
                for (final variant
                    in YaruVariant.values.take(10)) // skip flavors
                  PopupMenuItem(
                    onTap: () => AppTheme.apply(
                      context,
                      variant: variant,
                      highContrast: false,
                    ),
                    child: ColorDisk(
                      color: variant.color,
                      selected: variant == theme.variant &&
                          theme.highContrast != true,
                      onPressed: () {},
                    ),
                  )
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _views[_selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.font_download_outlined),
            activeIcon: Icon(Icons.font_download),
            label: 'Fonts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked_outlined),
            activeIcon: Icon(Icons.radio_button_checked),
            label: 'Controls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            activeIcon: Icon(Icons.text_fields_outlined),
            label: 'Text Fields',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens_outlined),
            activeIcon: Icon(Icons.color_lens),
            label: 'Palette',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {incrementCounter()},
        child: const Icon(Icons.plus_one),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
