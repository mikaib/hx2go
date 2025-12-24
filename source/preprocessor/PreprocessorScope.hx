package preprocessor;

@:structInit
class PreprocessorScope {

    public var variables: Map<String, String> = [];

    public function copy(): PreprocessorScope {
        return {
            variables: variables.copy()
        };
    }

}
