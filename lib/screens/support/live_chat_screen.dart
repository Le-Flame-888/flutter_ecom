import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'feedback_screen.dart';

class LiveChatScreen extends StatefulWidget {
  static const routeName = '/live-chat';

  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {
      'isUser': false,
      'message':
          "Hi there! I'm Sarah. How can I help you with your order today?",
      'time': '10:24 AM',
    },
    {
      'isUser': true,
      'message':
          "Hey! I wanted to check if the Neon Summer Jacket is back in stock in size M?",
      'time': '10:25 AM',
    },
    {
      'isUser': false,
      'message': 'Let me check that for you right now...',
      'time': '10:25 AM',
      'isTyping': true,
    },
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'message': _messageController.text,
        'time': 'Now',
      });
      _messageController.clear();
    });

    // Simulate jumping to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _endChat() {
    Navigator.of(context).pushReplacementNamed(FeedbackScreen.routeName);
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
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF3F3F3)),
              ),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAEANBlN8mbbCFKlyKbiK4x3Kp0HjUAskCVD-caxpVEyH4ZCxrzZYcuiTuYFtlT8KYOjbzfhjaibqbjAuy_IMr3VmaFIr_O1xdubaUDTEzL1g_ZkphG4_uM4nZKwnVy6cJdeGpBuUuGiEmP-YifE6DR2FVX-LKSmymZwBrbaqP5TQH4I8d7yVQ_jozTDYijbrxdUjwB-VWl3KKARKkaZ6xrCW0Vo0Zf3ISQ_5XUZ7RS_8RfbuE4i9Gs8UAzeKC0LVnoS3Mo3wJ-oyti',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sarah',
                  style: TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'STITCH SUPPORT',
                  style: TextStyle(
                    color: const Color(0xFFBDBDBD),
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppTheme.black),
            onPressed: () {
              // Show menu with "End Chat" option
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                builder: (ctx) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.close, color: Colors.red),
                        title: const Text(
                          'END CHAT SESSION',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(ctx);
                          _endChat();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'TODAY',
                style: TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['isUser'] as bool;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isUser) ...[
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCihKRYqHkcA_YNPzor9CuBKrZbOvNEzalBZa7xzvjQod3Mjlm1x1d9XPlmxqGxa8l5fzpch-0tRWah2jkCVoAwJJYwBa4EUUw8PnANYDdQEbJdL8P96Cn_xZvz4Aq19I5CeJE47O7xlNfkGdhy3Y0qrr1A0cvFCo2YsiukVsRFxKWiKyM-oXmN6JXxY3FfX-KdCv15W1B_tcTCi5PZD5exwTKLW4Xf_Ee8n7hQMKe-fiec0fpJ4T12TcJ9Ja9U8tdeYxVbK_6wurfI',
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],

                      Flexible(
                        child: Column(
                          crossAxisAlignment: isUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? AppTheme.primaryColor
                                    : const Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(24),
                                  topRight: const Radius.circular(24),
                                  bottomLeft: Radius.circular(isUser ? 24 : 4),
                                  bottomRight: Radius.circular(isUser ? 4 : 24),
                                ),
                              ),
                              child: Text(
                                msg['message'],
                                style: const TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            if (msg['isTyping'] == true) ...[
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  _buildDot(),
                                  const SizedBox(width: 2),
                                  _buildDot(),
                                  const SizedBox(width: 2),
                                  _buildDot(),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Sarah is typing',
                                    style: TextStyle(
                                      color: AppTheme.mediumGray,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ] else
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  msg['time'],
                                  style: TextStyle(
                                    color: AppTheme.mediumGray,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      if (isUser) ...[
                        const SizedBox(width: 8),
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuAoGNmOplurnTbe27Bdd1Y6EFUTyBxNVvUedH4xp_UmK45tdo6bpktYbHqMEoW2xbr-9naV4U5OVP7GcHkRpSoX12gM90tOyTEdWdSjfcawMbJQLFGXC5EqnKFFwMTn_fp0qj3zK8ves6Pd8fl-3VilUlkG8qfyZ_RZnsq9sjrnzpwciLTCce-5yLajRNvWd4vNfwOUhaltqbF8dAuVmgzuT7Mx6mOIKsaLZhOumNcb1VHwe0wWTAXaw4zxQiNnoJHJoI8FT0eNN1WT',
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppTheme.whiteColor,
              border: Border(top: BorderSide(color: AppTheme.lightGray)),
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.lightGray,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: AppTheme.mediumGray),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message...',
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: AppTheme.black),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
