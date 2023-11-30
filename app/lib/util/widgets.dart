import 'package:flutter/material.dart';

class WidgetSpace extends StatelessWidget {
  const WidgetSpace({Key? key, this.child, this.space = 0.0}) : super(key: key);
  final dynamic child;
  final double space;
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          child,
          SizedBox(
            height: space,
          )
        ],
      );
}

class InputBox extends StatefulWidget {
  const InputBox({
    Key? key,
    this.inputLabel,
    this.placeHolder,
    this.isPassword = false,
    this.textArea = false,
    this.update,
    this.customController,
    this.isPhone = false,
    required this.icon,
  }) : super(key: key);

  final Icon icon;
  final inputLabel;
  final placeHolder;
  final isPassword;
  final textArea;
  final customController;
  final update;
  final isPhone;

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  TextEditingController controller = TextEditingController();
  bool showError = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void _validateInput() {
    final inputValue = controller.text.trim();
    final hasInput = inputValue.isNotEmpty;
    setState(() {
      showError = !hasInput;
    });
  }

  void _handleFocusChange() {
    if (!focusNode.hasFocus) {
      _validateInput();
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              widget.update(value);
              _validateInput();
            },
            controller: controller,
            focusNode: focusNode,
            obscureText: widget.isPassword,
            keyboardType:
                widget.isPhone ? TextInputType.phone : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: widget.icon,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 16, color: Colors.white),
              ),
              hintText: widget.placeHolder,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
              labelText: widget.inputLabel,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              errorText: showError
                  ? 'Please enter a valid  ${widget.inputLabel}'
                  : null,
            ),
            minLines: 1,
            maxLines: widget.textArea ? 6 : 1,
          ),
        ],
      );
}

class BeatingHeart extends StatefulWidget {
  const BeatingHeart({super.key});

  @override
  State<BeatingHeart> createState() => _BeatingHeartState();
}

class _BeatingHeartState extends State<BeatingHeart>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);

    _animation = Tween(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) {
          return Transform.scale(
            scale: _animation.value,
            child: const Icon(
              Icons.favorite,
              size: 100,
              color: Colors.red,
            ),
          );
        });
  }
}

// class MemoryCard extends StatelessWidget {
//   final String? imageUrl;
//   final String? memoryText;
//   final String? desc;

//   MemoryCard({
//     required this.imageUrl,
//     required this.memoryText,
//     required this.desc,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Flexible(
//             flex: 1,
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
//                 image: DecorationImage(
//                   image: AssetImage(imageUrl!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   memoryText ?? '',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8, // Adjust this spacing as needed
//                 ),
//                 Text(
//                   desc ?? '',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class MemoryCard extends StatelessWidget {
  final String? imageUrl;
  final String? memoryText;
  final String? desc;

  MemoryCard({
    required this.imageUrl,
    required this.memoryText,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                image: DecorationImage(
                  image: AssetImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memoryText ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 8, // Adjust this spacing as needed
                ),
                Text(
                  desc ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackbar(BuildContext context,
    {String text = 'Please Enter All Required Fields!'}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(35, 5, 35, 25),
      backgroundColor: const Color(0xFFC72C41),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

void successSnackbar(BuildContext context,
    {String text = 'Your data is Saved Successfully!!'}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(35, 5, 35, 25),
      backgroundColor: Color.fromARGB(255, 75, 199, 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Future showConfirmationDialog(
    BuildContext context, String title, String content) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // User confirmed
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // User canceled
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
