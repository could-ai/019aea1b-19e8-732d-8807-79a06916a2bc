import 'package:flutter/material.dart';
import '../models/agent_model.dart';
import '../widgets/agent_card.dart';

class AgentsListScreen extends StatefulWidget {
  const AgentsListScreen({super.key});

  @override
  State<AgentsListScreen> createState() => _AgentsListScreenState();
}

class _AgentsListScreenState extends State<AgentsListScreen> {
  // Mock data
  final List<Agent> _agents = [
    Agent(
      id: '1',
      name: 'Asystent Sprzedaży',
      type: AgentType.emailResponder,
      status: AgentStatus.active,
      description: 'Odpowiada na zapytania ofertowe.',
      tasksCompleted: 124,
    ),
    Agent(
      id: '2',
      name: 'Wsparcie Techniczne L1',
      type: AgentType.customerSupport,
      status: AgentStatus.active,
      description: 'Rozwiązuje proste problemy techniczne.',
      tasksCompleted: 89,
    ),
    Agent(
      id: '3',
      name: 'Analizator Rynku',
      type: AgentType.productResearch,
      status: AgentStatus.idle,
      description: 'Szuka trendów w branży SaaS.',
      tasksCompleted: 12,
    ),
    Agent(
      id: '4',
      name: 'Generator Raportów Tygodniowych',
      type: AgentType.reportGenerator,
      status: AgentStatus.paused,
      description: 'Tworzy podsumowania sprzedaży.',
      tasksCompleted: 450,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: _agents.length,
        itemBuilder: (context, index) {
          return AgentCard(agent: _agents[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/create-agent');
        },
        label: const Text('Nowy Agent'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
