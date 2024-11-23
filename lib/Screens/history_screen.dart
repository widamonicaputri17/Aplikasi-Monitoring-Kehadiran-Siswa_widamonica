import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<AttendanceProvider>(context).history;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (ctx, index) {
            final record = history[index];
            return Card(
              color: Colors.green,
              child: ListTile(
                title: Text(
                  '${record['date'].day} ${_getMonthName(record['date'].month)} ${record['date'].year}',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return months[month - 1];
  }
}
