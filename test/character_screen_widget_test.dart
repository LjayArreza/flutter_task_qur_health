import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_qur_health/data/character_repository.dart';
import 'package:flutter_task_qur_health/presentation/bloc/character_bloc.dart';
import 'package:flutter_task_qur_health/presentation/ui/character_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() {
  testWidgets('CharacterScreen renders correctly', (WidgetTester tester) async {
    final Dio dio = Dio();
    final CharacterRepository repository = CharacterRepository(dio);
    final CharacterBloc characterBloc = CharacterBloc(repository);

    // Pump the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => characterBloc,
          child: const CharacterScreen(),
        ),
      ),
    );

    // Wait for all asynchronous operations to complete
    await tester.pumpAndSettle();

    // Verify the presence of widgets
    expect(find.text('Character List'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Clear Filters'), findsOneWidget);
  });
}
