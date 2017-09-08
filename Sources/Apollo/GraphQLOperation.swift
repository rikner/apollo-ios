public protocol GraphQLOperation: class {
  static var operationString: String { get }
  static var requestString: String { get }
  static var operationIdentifier: String? { get }
  
  var variables: GraphQLMap? { get }
  var type: OperationType { get }
  
  associatedtype Data: GraphQLSelectionSet
}

public extension GraphQLOperation {
  static var requestString: String {
    return operationString
  }

  static var operationIdentifier: String? {
    return nil
  }

  var variables: GraphQLMap? {
    return nil
  }
}

public protocol GraphQLQuery: GraphQLOperation {}
extension GraphQLQuery {
    var type: OperationType { return .Query }
}

public protocol GraphQLMutation: GraphQLOperation {}
extension GraphQLMutation {
    var type: OperationType { return .Mutation }
}

public protocol GraphQLFragment: GraphQLSelectionSet {}

public enum OperationType {
    case Query
    case Mutation
}
