import 'package:flutter/material.dart';

void main() {
  runApp(const TradingAIApp());
}

class TradingAIApp extends StatelessWidget {
  const TradingAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TradingAIHomePage(),
    );
  }
}

class TradingAIHomePage extends StatefulWidget {
  const TradingAIHomePage({super.key});

  @override
  State<TradingAIHomePage> createState() => _TradingAIAppState();
}

class _TradingAIAppState extends State<TradingAIHomePage> {
  bool _isAnalyzing = false;
  String _report = "بۆ شیکردنەوەی بازاڕ، دوگمەکە دابگرە";

  void _startAnalysis() {
    setState(() {
      _isAnalyzing = true;
    });
    
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAnalyzing = false;
        _report = "شیکردنەوە تەواو بوو: بازاڕ لە ئێستادا گونجاوە بۆ کڕین.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text("Trading AI Assistant"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _isAnalyzing ? null : _startAnalysis,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("دەستپێکردنی شیکردنەوە"),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: _isAnalyzing
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text(
                      _report,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}