import 'package:catalogue/screens/components/menubuttons.dart';
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Catalogue de vos sites favois ")),
      drawer: const _Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // _Button(),
            // _ListTile(),
            // _SwitchListTile(),
            // _CheckBoxListTile(),
            // _RadioListTile(),
            // _SelectBox(),
            // _TextFormField(),

            // _AppBar(),
            // _Grid(),
            // _ErrorMessage(),
            // _Text(),
            // _RadioListTile(),
            // _SelectBox(),
            // _CheckBoxListTile()
          ],
        ),
      ),
      bottomNavigationBar: const MenuButton(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Button"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
              TextButton(onPressed: () {}, child: const Text("Text")),
              OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GSectionTitle("List tile"),
        ListTile(
          title: Text("Title"),
          subtitle: Text("Subtitle"),
        ),
      ],
    );
  }
}

class _SwitchListTile extends StatefulWidget {
  const _SwitchListTile({Key? key}) : super(key: key);

  @override
  State<_SwitchListTile> createState() => _SwitchListTileState();
}

class _SwitchListTileState extends State<_SwitchListTile> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Switch"),
        SwitchListTile(
          title: const Text("Switch"),
          subtitle: const Text("Switch subtitle"),
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      ],
    );
  }
}

class _CheckBoxListTile extends StatefulWidget {
  const _CheckBoxListTile({Key? key}) : super(key: key);

  @override
  State<_CheckBoxListTile> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<_CheckBoxListTile> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Check box"),
        CheckboxListTile(
          isThreeLine: true,
          // dense: true,
          title: const Text("Check box"),
          subtitle: const Text("Check box subtitle"),
          value: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
      ],
    );
  }
}

class _RadioListTile extends StatefulWidget {
  const _RadioListTile({Key? key}) : super(key: key);

  @override
  State<_RadioListTile> createState() => _RadioListTileState();
}

class _RadioListTileState extends State<_RadioListTile> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Radio"),
        RadioListTile<int>(
          title: const Text("Radio 1"),
          value: 1,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
        RadioListTile<int>(
          title: const Text("Radio 2"),
          value: 2,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
        RadioListTile<int>(
          title: const Text("Radio 3"),
          value: 3,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
      ],
    );
  }
}

class _SelectBox extends StatefulWidget {
  const _SelectBox({Key? key}) : super(key: key);

  @override
  State<_SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<_SelectBox> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Select box"),
        GSelectBox<int>(
          value: value,
          items: [
            GSelectBoxItem(
              title: "Select 1",
              value: 1,
            ),
            GSelectBoxItem(
              title: "Select 2",
              value: 2,
            ),
            GSelectBoxItem(
              title: "Select 3",
              value: 3,
            ),
          ],
          onChanged: (value) => setState(() => this.value = value),
        ),
      ],
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Text form field"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GOutlinedFormField(label: "Username"),
              SizedBox(height: 16),
              GUnderlinedFormField(
                label: "Password",
                passwordField: true,
              ),
              SizedBox(height: 16),
              GFilledFormField(
                label: "Re-enter password",
                passwordField: true,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController rechercheController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const GSectionTitle("App Bar"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppBar(
            elevation: 0,
            title: const Text("Catalogue"),
            centerTitle: true,
            actions: [CircleAvatar(child: Icon(Icons.person))],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: rechercheController,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    hintText: "Recherchez vos sites",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.camera_alt_outlined),
                    )),
              )),
        )
      ],
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GSectionTitle("Grid"),
        GGrid(
          gap: 16,
          padding: EdgeInsets.all(16),
          columnCount: 3,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Card"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Card"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Card"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Error message"),
        GErrorMessage(
          icon: const Icon(Icons.wifi_off_outlined),
          title: "No internet",
          subtitle:
              "Can't connect to the internet.\nPlease check your internet connection",
          buttonLabel: "Try again",
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Text"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("headline1", style: textTheme.headline1),
              Text("headline2", style: textTheme.headline2),
              Text("headline3", style: textTheme.headline3),
              Text("headline4", style: textTheme.headline4),
              Text("headline5", style: textTheme.headline5),
              Text("headline6", style: textTheme.headline6),
              Text("subtitle1", style: textTheme.subtitle1),
              Text("subtitle2", style: textTheme.subtitle2),
              Text("bodyText1", style: textTheme.bodyText1),
              const Text("bodyText2"),
              Text("button", style: textTheme.button),
              Text("caption", style: textTheme.caption),
              Text("overline", style: textTheme.overline),
            ],
          ),
        )
      ],
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const GSectionTitle("Drawer list tile"),
            GDrawerListTile(
              leading: const Icon(Icons.inbox_outlined),
              title: "Inbox",
              trailing: const Text("1"),
              selected: true,
              onTap: () {},
            ),
            GDrawerListTile(
              leading: const Icon(Icons.drafts_outlined),
              title: "Unread",
              onTap: () {},
            ),
            GDrawerListTile(
              leading: const Icon(Icons.star_outlined),
              title: "Starred",
              trailing: const Text("10"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
