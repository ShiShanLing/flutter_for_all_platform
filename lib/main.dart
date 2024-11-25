import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:my_app/excel_read/excel_read.dart';
import 'package:my_app/flutter_highlight_demo/flutter_highlight_demo.dart';
import 'package:my_app/pages/home-page/HomePage.dart';
import 'package:my_app/pages/questions-input-preview/questions-input-preview.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:go_router/go_router.dart';

import 'package:desktop_window/desktop_window.dart';

import 'package:my_app/Head/common_func.dart';

// import './drift/screens/home.dart';
import './drift/screens/search.dart';
import './pages/question-page/QuestionPage.dart';
//toast
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置窗口大小
  await DesktopWindow.setMinWindowSize(Size(800, 600));

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => LoaderOverlay(
            overlayColor: kColor(49, 49, 49, 0.6), child: HomePage()),
        routes: [
          GoRoute(
            path: 'search',
            builder: (_, __) => const SearchPage(),
          ),
          GoRoute(
            path: 'quizPage',
            builder: (_, __) => QuizPage(),
          ),
          GoRoute(
            path: 'highlightDemo',
            builder: (_, __) => MyHighlightApp(),
          ),
          GoRoute(
            path: 'excelReadApp',
            builder: (_, __) => MyExcelReadApp(),
          ),
          GoRoute(
            path: 'previewInput',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              return PreviewQuestionsPage(
                questions: extra['questions'],
                subject: extra['subject'],
              );
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ToastificationWrapper(
        config: ToastificationConfig(),
        child: MaterialApp.router(
          title: 'Drift Todos',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            typography: Typography.material2018(),
          ),
          routerConfig: _router,
        ),
      ),
    );
  }
}
