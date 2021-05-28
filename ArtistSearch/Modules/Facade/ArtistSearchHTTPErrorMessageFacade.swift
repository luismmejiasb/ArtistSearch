import HTTPErrorMessage

class ArtistSearchHTTPErrorMessageFacade {
    static func getHTTPError(withErrorCode errorCode: Int) -> String {
        return HTTPErrorMessage.getHTTPError(withErrorCode: errorCode)
    }
}
