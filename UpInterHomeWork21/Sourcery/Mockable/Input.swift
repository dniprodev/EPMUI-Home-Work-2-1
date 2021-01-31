/// Do not delete 'AutoMockable'

protocol NetworkProviderType: AutoMockable {
    func sendRequest(_ target: TargetType, completion: @escaping(NetworkCompletionHandler))
}

protocol AutoMockable {
    
}
