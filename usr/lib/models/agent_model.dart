enum AgentType {
  emailResponder,
  customerSupport,
  productResearch,
  reportGenerator,
}

enum AgentStatus {
  active,
  idle,
  paused,
}

class Agent {
  final String id;
  final String name;
  final AgentType type;
  final AgentStatus status;
  final String description;
  final int tasksCompleted;

  Agent({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.description,
    this.tasksCompleted = 0,
  });

  String get typeDisplayName {
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
}
