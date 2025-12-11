import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:inicio/core/generated/app_text_styles.dart';

class SearchView extends StatefulWidget {
  static const routeName = 'search';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          style: TextStyles.poppinsW400S16.copyWith(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'Buscar',
            hintStyle: TextStyles.poppinsW400S16.copyWith(
              color: const Color(0xffBBBBBB),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      body: Center(
        child: Text(
          'Type Something to search',
          style: TextStyles.poppinsW500S14.copyWith(color: const Color(0xffBBBBBB)),
        ),
      ),
    );
  }
}