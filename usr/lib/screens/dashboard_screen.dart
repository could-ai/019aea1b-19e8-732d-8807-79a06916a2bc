import 'package:flutter/material.dart';
import '../models/agent_model.dart';
import '../widgets/agent_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for dashboard
    final recentAgents = [
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
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Witaj w CouldAI',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Zarządzaj swoją flotą agentów AI.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          
          // Stats Row
          Row(
            children: [
              _buildStatCard(context, 'Aktywni Agenci', '4', Icons.people, Colors.blue),
              const SizedBox(width: 16),
              _buildStatCard(context, 'Ukończone Zadania', '1,240', Icons.check_circle, Colors.green),
            ],
          ),
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ostatnia aktywność',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/agents');
                },
                child: const Text('Zobacz wszystkich'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          ...recentAgents.map((agent) => AgentCard(agent: agent)),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 16),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
