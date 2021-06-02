enum CloudSourceErrors: Error {
    case emptyResponse
    case responseCannotBeParsed
    case objectNotFound
}
