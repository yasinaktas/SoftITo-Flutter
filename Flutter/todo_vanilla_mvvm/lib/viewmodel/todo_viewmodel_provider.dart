import 'package:flutter/widgets.dart';
import 'package:todo_vanilla_mvvm/viewmodel/todo_viewmodel.dart';

class TodoViewmodelProvider extends InheritedWidget {
  final TodoViewmodel viewmodel;

  const TodoViewmodelProvider({
    required super.child,
    required this.viewmodel,
    super.key,
  });

  static TodoViewmodel of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<TodoViewmodelProvider>();
    if (provider == null) {
      throw Exception('TodoViewmodelProvider not found in context');
    }
    return provider.viewmodel;
  }

  static TodoViewmodel read(BuildContext context) {
    final provider = context
        .getInheritedWidgetOfExactType<TodoViewmodelProvider>();
    if (provider == null) {
      throw Exception('TodoViewmodelProvider not found in context');
    }
    return provider.viewmodel;
  }

  @override
  bool updateShouldNotify(TodoViewmodelProvider oldWidget) {
    return viewmodel != oldWidget.viewmodel;
  }
}
