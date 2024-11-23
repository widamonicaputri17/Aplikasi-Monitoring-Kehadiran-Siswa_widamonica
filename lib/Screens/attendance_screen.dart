import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: attendanceProvider.siswaList.length,
              itemBuilder: (ctx, index) {
                final student = attendanceProvider.siswaList[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: Checkbox(
                    value: student.isPresent,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      attendanceProvider.toggleAttendance(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: attendanceProvider.siswaList.any((s) => s.isPresent)
                  ? () {
                      attendanceProvider.saveAttendance();
                    }
                  : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }
                  return Colors.green;
                },
              ), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.black; // Warna teks saat tombol dinonaktifkan
                  }
                  return Colors.white; // Warna teks saat tombol aktif
                },
              )),
              child: const Text('Simpan Kehadiran'),
            ),
          ),
        ],
      ),
    );
  }
}
