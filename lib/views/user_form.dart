import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuário '),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState?.save();

                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'] ?? "",
                    name: _formData['name'] ?? "",
                    email: _formData['email'] ?? "",
                    AvatarUrl: _formData['avatarUrl'] ?? "",
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome invalido';
                  }

                  if (value.trim().length <= 3) {
                    return 'Nome pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value ?? "",
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value ?? "",
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Url do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
