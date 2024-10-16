import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _notes = {};
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 245, 245, 245),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildCurrentDate(), // Current Date with updated UI
              SizedBox(height: 10),
              _buildCalendar(), // Calendar widget
              SizedBox(height: 16),
              Expanded(child: _buildNotesList()), // Notes list
            ],
          ),
        ),
      ),
    );
  }

  // Current Date and Time Display with modern UI
  Widget _buildCurrentDate() {
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(DateTime.now());
    String formattedTime = DateFormat('h:mm a').format(DateTime.now());

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(224, 10, 10, 10),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today: $formattedDate',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'Time: $formattedTime',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.note_add, color: Colors.white),
            onPressed: _addNoteDialog,
          ),
        ],
      ),
    );
  }

  // Calendar Widget
  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          firstDay: DateTime(2020),
          lastDay: DateTime(2030),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 70, 14), // Green for selected day
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.green[300], // Light green for today
              shape: BoxShape.circle,
            ),
            weekendTextStyle: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }

  // Dialog to Add a Note
  void _addNoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              'Add Note for ${DateFormat('MMMM d, y').format(_selectedDay)}'),
          content: TextField(
            controller: _noteController,
            decoration: InputDecoration(hintText: 'Enter your note here'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_noteController.text.isNotEmpty) {
                  setState(() {
                    if (_notes[_selectedDay] == null) {
                      _notes[_selectedDay] = [];
                    }
                    _notes[_selectedDay]?.add(_noteController.text);
                    _noteController.clear();
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save', style: TextStyle(color: Colors.green[700])),
            ),
          ],
        );
      },
    );
  }

  // Display Notes List
  Widget _buildNotesList() {
    return _notes[_selectedDay]?.isNotEmpty ?? false
        ? ListView.builder(
            itemCount: _notes[_selectedDay]?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    _notes[_selectedDay]![index],
                    style: TextStyle(color: Colors.green[700]),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              'No notes for today',
              style: TextStyle(color: Colors.green[700], fontSize: 16),
            ),
          );
  }
}
