import 'package:flutter/material.dart';
import '../models/agent_model.dart';

class CreateAgentScreen extends StatefulWidget {
  const CreateAgentScreen({super.key});

  @override
  State<CreateAgentScreen> createState() => _CreateAgentScreenState();
}

class _CreateAgentScreenState extends State<CreateAgentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  AgentType _selectedType = AgentType.emailResponder;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stwórz Nowego Agenta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Konfiguracja Agenta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Zdefiniuj rolę i zadania dla swojego nowego cyfrowego pracownika.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              
              // Name Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nazwa Agenta',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać nazwę agenta';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 24),

              // Type Dropdown
              DropdownButtonFormField<AgentType>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Typ Agenta',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work),
                ),
                items: AgentType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(_getTypeName(type)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Description Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Instrukcje / Opis',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać opis zadań';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _submitForm,
                  child: const Text('Utwórz Agenta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTypeName(AgentType type) {
    switch (type) {
      case AgentType.emailResponder:
        return 'Odpowiadanie na maile';
      case AgentType.customerSupport:
        return 'Obsługa klientów';
      case AgentType.productResearch:
        return 'Research produktu';
      case AgentType.reportGenerator:
        return 'Generowanie raportów';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // Here we would normally call the backend to create the agent
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utworzono agenta: $_name')),
      );
      
      Navigator.pop(context);
    }
  }
}
