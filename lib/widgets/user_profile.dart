import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  // static тк константы не ставятся тк ниже конструктор вызывает ошибку
  static List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call, 'Недавние звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  static List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфиденциальность'),
    MenuRowData(Icons.data_usage, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];

  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Container(
        //максимальная ширина контейнера
        width: double.infinity,
        child: Column(
          // выравнивание по высоте
          mainAxisAlignment: MainAxisAlignment.start,
          //центрируем контент внутри контейнера
          crossAxisAlignment: CrossAxisAlignment.center,
          //ертикальное направление
          verticalDirection: VerticalDirection.down,
          children: [
            _UserInfoWidget(),
            //отступ для нового блока
            SizedBox(height: 20, width: double.infinity),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 20, width: double.infinity),
            _MenuWidget(menuRow: secondMenuRow),
          ],
        ),
      ),
    );
    // return const Text('text');
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(
    this.icon,
    this.text,
  );
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //на всякий добавил ширину максимальную контейнеру
      width: double.infinity,
      child: Column(
        children: const [
          SizedBox(height: 30, width: double.infinity),
          // РЕФАКТОРИНГ КОДА ДЛЯ ЧТЕНИЯ
          //cmd+. 'extract widget' + создаем новый класс с видимостью только внутри файла
          // _AvatarWidget и теперь код перенесся в низ, а здесь он только вызывается
          _AvatarWidget(),
          //ширину добавил для общей картины,
          //вообще ширину нужно только для строк ставить
          SizedBox(height: 30, width: double.infinity),
          _UserNameWidget(),
          //SizedBox можно так же добавлять child
          SizedBox(height: 10, width: double.infinity),
          _UserNumberWidget(),
          SizedBox(height: 10, width: double.infinity),
          _NickNameWidget(),
          SizedBox(height: 20, width: double.infinity),
        ],
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        //может быть квадратные скобки здесь должны быть
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  // final IconData icon;
  // final String text;
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: const Placeholder(),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Eugen <Jio> Booo',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UserNumberWidget extends StatelessWidget {
  const _UserNumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+38(95)999 00 00',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class _NickNameWidget extends StatelessWidget {
  const _NickNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@Marubooo',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 17,
      ),
    );
  }
}
