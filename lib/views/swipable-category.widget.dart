import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/category_cubit.dart';

class SwipableCategory extends StatelessWidget {
  const SwipableCategory({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<CategoryCubit>().setCategory(category);
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xff583823),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        side: BorderSide(width: 3.0, color: Color(0xff583823)),
      ),
      child: Text(category),
    );
  }
}
