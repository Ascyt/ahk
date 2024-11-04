
import re
from typing import List, Union

def generate_nested_combinations(s: str) -> List:
    """
    Takes a string with numerical options separated by colons and returns a nested list
    of all possible combinations.

    Example:
        "Hello 0:10 world 1:2!" =>
        [["Hello 0 world 1!", "Hello 0 world 2!"], ["Hello 10 world 1!", "Hello 10 world 2!"]]
    """
    # Step 1: Split the string into fixed parts and option lists
    # Option lists are identified as sequences of digits separated by colons, e.g., "0:10"
    pattern = r'(\d+(?::\d+)*)'
    tokens = re.split(pattern, s)
    segments: List[Union[str, List[str]]] = []
    for token in tokens:
        if re.fullmatch(r'\d+(?::\d+)*', token):
            options = token.split(':')
            segments.append(options)
        else:
            if token:
                segments.append(token)

    # Step 2: Recursive function to build nested combinations
    def build_nested(segments: List[Union[str, List[str]]]) -> List:
        if not segments:
            return ['']
        first, *rest = segments
        if isinstance(first, list):
            nested = []
            for option in first:
                sub = build_nested(rest)
                # Concatenate the current option with each string in the sub-combinations
                combined = [option + s for s in sub]
                nested.append(combined)
            return nested
        else:
            sub = build_nested(rest)
            # Concatenate the fixed string with each string in the sub-combinations
            return [first + s for s in sub]

    return build_nested(segments)

# Example Usage
if __name__ == "__main__":
    input_str = "Hello 0:10 world 1:2!"
    result = generate_nested_combinations(input_str)
    print(result)
    # Expected Output:
    # [
    #     ["Hello 0 world 1!", "Hello 0 world 2!"],
    #     ["Hello 10 world 1!", "Hello 10 world 2!"]
    # ]