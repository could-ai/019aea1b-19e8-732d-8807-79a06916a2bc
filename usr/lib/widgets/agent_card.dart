import 'package:flutter/material.dart';
import '../models/agent_model.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  final VoidCallback? onTap;

  const AgentCard({super.key, required this.agent, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: _getColorForType(agent.type).withOpacity(0.2),
          child: Icon(_getIconForType(agent.type), color: _getColorForType(agent.type)),
        ),
        title: Text(
          agent.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(agent.typeDisplayName),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getStatusColor(agent.status),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _getStatusText(agent.status),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  'Zadania: ${agent.tasksCompleted}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Color _getColorForType(AgentType type) {
    switch (type) {
      case AgentType.emailResponder:
        return Colors.blue;
      case AgentType.customerSupport:
        return Colors.green;
      case AgentType.productResearch:
        return Colors.orange;
      case AgentType.reportGenerator:
        return Colors.purple;
    }
  }

  IconData _getIconForType(AgentType type) {
    switch (type) {
      case AgentType.emailResponder:
        return Icons.email;
      case AgentType.customerSupport:
        return Icons.support_agent;
      case AgentType.productResearch:
        return Icons.search;
      case AgentType.reportGenerator:
        return Icons.analytics;
    }
  }

  Color _getStatusColor(AgentStatus status) {
    switch (status) {
      case AgentStatus.active:
        return Colors.green;
      case AgentStatus.idle:
        return Colors.grey;
      case AgentStatus.paused:
        return Colors.amber;
    }
  }

  String _getStatusText(AgentStatus status) {
    switch (status) {
      case AgentStatus.active:
        return 'Aktywny';
      case AgentStatus.idle:
        return 'Oczekuje';
      case AgentStatus.paused:
        return 'Wstrzymany';
    }
  }
}
