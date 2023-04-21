import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/app/modules/home/home_controller.dart';

class HomeIncludeWidget extends StatelessWidget {
  HomeIncludeWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      height: 320,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Insira a descrição',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 6),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(24),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    label: const Text('Descrição'),
                  ),
                  controller: _title,
                  validator: (value) {
                    if (value!.isEmpty) return "Informe o título!";

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FilledButton.tonalIcon(
                    icon: const Icon(Icons.check),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await controller.save(_title.text);
                        if (context.mounted) {
                          Get.back();
                        }
                      }
                    },
                    label: const Text('Salvar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
