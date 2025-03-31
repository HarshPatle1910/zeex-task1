import 'package:flutter/material.dart';

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key, required this.title});

  final String title;

  @override
  State<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.blueGrey[800]),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewSection(),
            const SizedBox(height: 20),
            _buildFilters(),
            const SizedBox(height: 20),
            _buildEmployeeTable(),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildShiftTracking()),
                const SizedBox(width: 20),
                Expanded(child: _buildAttendanceOverview()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildOverviewCard('Total Employees', '50', Icons.people, Colors.blue),
        _buildOverviewCard(
          'Active Employees',
          '45',
          Icons.check_circle,
          Colors.green,
        ),
        _buildOverviewCard('Absent Employees', '5', Icons.cancel, Colors.red),
        _buildOverviewCard(
          'New Employees',
          '3',
          Icons.person_add,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropdown('All Departments'),
        _buildDropdown('All Shifts'),
        _buildDropdown('Performance Rating'),
      ],
    );
  }

  Widget _buildDropdown(String hint) {
    return DropdownButton<String>(
      hint: Text(hint),
      items:
          ['Option 1', 'Option 2', 'Option 3'].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (_) {},
    );
  }

  Widget _buildEmployeeTable() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Current Employee List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('+ Add New Employee'),
            ),
          ),
          _buildEmployeeTile(
            'E-101',
            'John Doe',
            'Store Manager',
            'Operations',
            'Morning',
            'Active',
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeTile(
    String id,
    String name,
    String role,
    String department,
    String shift,
    String status,
  ) {
    return ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text(name),
      subtitle: Text('$role - $department ($shift)'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildShiftTracking() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shift Tracking & Attendance',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('+ Add New Shift'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Attendance Overview',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Text('Attendance Chart Placeholder')),
            ),
            const SizedBox(height: 10),
            const Text(
              'Insights',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('• Lisa Brown has the highest attendance rate'),
            const Text('• Jane Smith shows irregular attendance patterns'),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard(
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
