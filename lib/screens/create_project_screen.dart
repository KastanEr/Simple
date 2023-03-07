import 'package:flutter/material.dart';
import 'package:simple/widget/tag_block_widget.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      appBar: AppBar(
        title: const Text("새 프로젝트 생성"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: "제목",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    const Divider(
                      height: 5,
                      thickness: 1.0,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "메모",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    const Divider(
                      height: 5,
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                      child: Row(
                        children: [
                          getTagList(),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 180, 180, 180),
                              size: 30,
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTagList() {
    return const TagBlock(
      tagName: "취미",
    );
  }
}
