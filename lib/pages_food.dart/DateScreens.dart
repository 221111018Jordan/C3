import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas/pages_food.dart/CartPage.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      _selectTime(context);
    }
  }

  TimeOfDay? selected_time;

  void _selectTime(BuildContext context) async {
    TimeOfDay? pickeds = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickeds != null) {
      setState(() {
        selected_time = pickeds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Waktu Pengambilan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Thank you for buying, when would you like to take your order?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  _selectedDate == null
                      ? 'pilih tanggal'
                      : DateFormat.yMMMd().format(_selectedDate!),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text(
                  selected_time == null
                      ? 'pilih waktu'
                      : "${selected_time!.hour}: ${selected_time!.minute.toString().padLeft(2, '0')}",
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if(_selectedDate != null && selected_time != null){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Thank you"),
                        content:
                            Text("Please wait while your food is being made"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()),
                              );
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );}
                },
                child: Text('Selesai'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
