import 'package:app/util/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final bool isProfessional;

  const PaymentPage({Key? key, this.isProfessional = true}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCBE = true;
  String transactionID = "";
  String fileName = '';

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 45,
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Icon(
            Icons.payments_rounded,
            size: 32,
            color: Colors.blue.shade800,
          ),
        ),
        title: Text(
          'Activate Your Account',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.blue.shade900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Center(
                  child: Image.asset('assets/images/main.png'),
                ),
              ),
              const WidgetSpace(
                space: 5,
                child: Text(
                  'Based on the information provided below, proceed to paying the registration fee and activate your account',
                  style: TextStyle(
                    height: 1.3,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
              ),
              WidgetSpace(
                space: 20,
                child: SizedBox(
                  width: cardWidth,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black12)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/CBE.png',
                                width: 120,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetSpace(
                                space: 7,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Account Name:\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '<Acc Name>',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              WidgetSpace(
                                space: 7,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Account Number:\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '10000000000000',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              WidgetSpace(
                                space: 7,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Register Fee:\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${widget.isProfessional ? 200 : 1000}ETB with one month free usage',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (widget.isProfessional)
                                WidgetSpace(
                                  space: 15,
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Monthly Payment:\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '100ETB per month',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const Text(
                            "All payments include VAT.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          const Text(
                            'N.B: For more info call 8891.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              WidgetSpace(
                space: 20,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black12)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Transaction ID',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Please add Transaction ID Of the payment you have completed.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        WidgetSpace(
                          space: 20,
                          child: InputBox(
                            inputLabel: 'Transaction ID',
                            placeHolder: 'Transaction ID',
                            icon: Icon(Icons.monetization_on),
                            update: (value) {
                              transactionID = value;
                              print(transactionID);
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.image,
                            );
                            if (result == null) {
                              setState(() {
                                fileName = '';
                              });
                              return;
                            }

                            final file = result.files.first;
                            setState(() {
                              fileName = file.name;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: Colors.grey.shade100,
                            ),
                            height: 190,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons
                                      .image, // Use the built-in Flutter image icon
                                  size: 50,
                                  color: Color.fromARGB(255, 36, 107, 253),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    fileName.isEmpty
                                        ? 'Upload receipt'
                                        : fileName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              WidgetSpace(
                space: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () async {},
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 116, 59, 107),
                          Color.fromARGB(255, 100, 58, 97)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                      ),
                      child: const Center(
                        child: Text(
                          'Activate',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
