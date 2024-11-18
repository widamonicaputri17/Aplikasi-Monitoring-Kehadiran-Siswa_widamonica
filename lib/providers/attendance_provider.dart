import 'package:flutter/foundation.dart';
import 'package:kehadiran_siswa/Models/siswa.dart';

class AttendanceProvider with ChangeNotifier {
  final List<Siswa> _siswaList = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
    Siswa(name: 'Ardiansyah'),
    Siswa(name: 'Rohmat'),
    Siswa(name: 'Denisa'),
    Siswa(name: 'Wawan'),
    Siswa(name: 'Risma'),
    Siswa(name: 'Rizqi'),
  ];

  // History
  final List<Map<String, dynamic>> _history = [];

  // Getter siswa list
  List<Siswa> get siswaList => _siswaList;

  // Getter attendance history
  List<Map<String, dynamic>> get history => _history;

  // Simpan attendance dan reset status presensi dari siswa
  void saveAttendance() {
    final present = _siswaList.where((siswa) => siswa.isPresent).length;
    final absent = _siswaList.length - present;

    _history.insert(0, {
      'date': DateTime.now(),
      'present': present,
      'absent': absent,
    });

    for (var siswa in _siswaList) {
      siswa.isPresent = false;
    }

    notifyListeners();
  }

  void toggleAttendance(int index) {
    _siswaList[index].isPresent = !_siswaList[index].isPresent;
    notifyListeners();
  }
}
