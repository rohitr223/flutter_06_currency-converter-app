import 'package:flutter/material.dart';


/*
      Steps for building app -:
      1) Create a variable that stores the converted currency value.
      2) Create a function that multiplies the value given by the text field.
      3) Store the value in the variable that we created.
      4) Display the variable as our answer. 
   */

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // inititlly the result will be zero
  double result = 0;
  double currentDollarRateInRupees = 83.14;

  // for text-field input
  TextEditingController textEditingController = TextEditingController();

  void convertToINR() {
    setState(() {
      result = double.parse(textEditingController.text) * currentDollarRateInRupees;
    });
  }

  @override
  void dispose() {
    // we dispose the textEditingController
    // it avoids memory leaks
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // show output upto 2 decimal places
            "₹ ${result.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: TextField(
              controller: textEditingController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Enter amount in USD",
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true, // include decimal value
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: convertToINR,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Convert",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
