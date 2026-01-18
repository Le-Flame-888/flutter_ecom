import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'return_method_screen.dart';

class ReturnReasonScreen extends StatefulWidget {
  static const routeName = '/return-reason';

  const ReturnReasonScreen({super.key});

  @override
  State<ReturnReasonScreen> createState() => _ReturnReasonScreenState();
}

class _ReturnReasonScreenState extends State<ReturnReasonScreen> {
  String? _selectedReason = 'Too large';
  final TextEditingController _commentController = TextEditingController();

  final List<String> _reasons = [
    'Too large',
    'Too small',
    'Defective/Damaged',
    'Changed my mind',
    'Item not as described',
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select Reason',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Step Indicator
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: ReturnStepIndicator(currentStep: 1),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reason List
                  ..._reasons.map((reason) => _buildReasonItem(reason)),

                  const SizedBox(height: 32),

                  // Comments
                  Row(
                    children: [
                      const Text(
                        'Additional Comments',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(Optional)',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.mediumGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _commentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Tell us more about the issue...',
                        hintStyle: TextStyle(
                          color: AppTheme.mediumGray.withOpacity(0.5),
                        ),
                        contentPadding: const EdgeInsets.all(24),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ReturnMethodScreen.routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: AppTheme.black,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }

  Widget _buildReasonItem(String reason) {
    bool isSelected = _selectedReason == reason;
    return GestureDetector(
      onTap: () => setState(() => _selectedReason = reason),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              reason,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.black,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : const Color(0xFFE0E0E0),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: AppTheme.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnStepIndicator extends StatelessWidget {
  final int currentStep;

  const ReturnStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Lines
          Row(
            children: [
              Expanded(child: _buildLine(currentStep > 1)),
              Expanded(child: _buildLine(currentStep > 2)),
            ],
          ),
          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStep(1, 'REASON', currentStep >= 1),
              _buildStep(2, 'METHOD', currentStep >= 2),
              _buildStep(3, 'CONFIRM', currentStep >= 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLine(bool isActive) {
    return Container(
      height: 2,
      color: isActive ? AppTheme.primaryColor : const Color(0xFFEEEEEE),
    );
  }

  Widget _buildStep(int step, String label, bool isActive) {
    bool isDone = isActive && currentStep > step;

    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppTheme.primaryColor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppTheme.primaryColor : const Color(0xFFEEEEEE),
              width: 2,
            ),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, size: 16, color: AppTheme.black)
                : Text(
                    '$step',
                    style: TextStyle(
                      color: isActive
                          ? AppTheme.black
                          : const Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: isActive ? AppTheme.black : const Color(0xFFBDBDBD),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
