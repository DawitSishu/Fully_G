import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class MemoryCard extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String memoryText;

  MemoryCard({
    required this.imageUrl,
    required this.date,
    required this.memoryText,
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
          Container(
            width: double.infinity,
            height: 150.0, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date: $date',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  memoryText,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
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

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.placeHolder,
    this.update,
    this.inputLabel,
  });
  final placeHolder;
  final inputLabel;
  final update;
  @override
  State<StatefulWidget> createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ''; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: dateInput,
        //editing controller of this TextField
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 16, color: Colors.white),
          ),
          labelText: widget.inputLabel,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
        //set it true, so that user will not able to edit text
        onTap: () async {
          final pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2120),
          );

          if (pickedDate != null) {
            print(
              pickedDate,
            ); //pickedDate output format => 2021-03-10 00:00:00.000
            final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            //formatted date output using intl package =>  2021-03-16
            setState(() {
              dateInput.text =
                  formattedDate; //set output date to TextField value.
              //update the value;
              widget.update(formattedDate);
            });
          } else {}
        },
      );
}
