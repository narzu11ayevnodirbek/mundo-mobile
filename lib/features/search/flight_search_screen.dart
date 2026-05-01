import 'package:flutter/material.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  late AnimationController _swapController;
  int adults = 1;
  int children = 0;
  int infants = 0;
  String cabinClass = "Ekonom";

  DateTime? selectedDate;

  // double _rotation = 0;
  bool isSwapped = false;

  void _swapLocations() {
    setState(() {
      isSwapped = !isSwapped;

      final temp = fromController.text;
      fromController.text = toController.text;
      toController.text = temp;
    });
  }

  Widget _buildSwapButton() {
    return Center(
      child: GestureDetector(
        onTap: _swapLocations,
        child: AnimatedRotation(
          turns: isSwapped ? 0.5 : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.2))],
            ),
            child: const Icon(Icons.swap_vert, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    _swapController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _swapController.dispose();
    super.dispose();
  }

  void _openTravellerSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sayohatchilar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  _counterTile("Kattalar", adults, (val) {
                    setModalState(() => adults = val);
                  }),

                  _counterTile("Bolalar", children, (val) {
                    setModalState(() => children = val);
                  }),

                  _counterTile("Chaqaloqlar", infants, (val) {
                    setModalState(() => infants = val);
                  }),

                  const SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    value: cabinClass,
                    decoration: InputDecoration(
                      labelText: "Cabin Class",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    items: [
                      "Ekonom",
                      "Biznes",
                      "Standard",
                    ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) {
                      setModalState(() => cabinClass = val!);
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {}); // main UI update
                        Navigator.pop(context);
                      },
                      child: const Text("Bajarildi"),
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _counterTile(String title, int value, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: [
            IconButton(
              onPressed: value > 0 ? () => onChanged(value - 1) : null,
              icon: const Icon(Icons.remove),
            ),
            Text(value.toString()),
            IconButton(onPressed: () => onChanged(value + 1), icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Parvozlar", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          tabs: const [
            Tab(text: "Qaytish"),
            Tab(text: "Bir yo'nalish"),
            Tab(text: "Ko'p shaharga"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          _buildTextField("From", Icons.flight_takeoff, fromController),
                          const SizedBox(height: 12),
                          _buildTextField("To", Icons.flight_land, toController),
                        ],
                      ),
                      Positioned(top: 40, child: _buildSwapButton()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDatePicker(),
                  const SizedBox(height: 12),
                  _buildTraveller(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.05))],
      ),
      child: child,
    );
  }

  Widget _buildTextField(String hint, IconData icon, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffF1F3F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: pickDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xffF1F3F6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 10),
            Text(
              selectedDate == null
                  ? "Sana tanlang"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTraveller() {
    int total = adults + children + infants;

    return GestureDetector(
      onTap: _openTravellerSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xffF1F3F6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.people),
            const SizedBox(width: 10),
            Text("$total sayohatchi • $cabinClass"),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.black,
        ),
        child: const Text("Parvozlarni qidirish", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
