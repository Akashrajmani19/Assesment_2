def convert_dict(input_dict):
    output = {}
    stack = []

    def recursive_helper(current_dict):
        for key, value in current_dict.items():
            if isinstance(value, dict):
                stack.append(key)
                recursive_helper(value)
                stack.pop()
            else:
                new_key = stack + [key]
                if stack:
                    parent_key = stack[-1]
                    if parent_key not in output:
                        output[parent_key] = []
                    output[parent_key].append(new_key[-1])
                else:
                    output[new_key[-1]] = value

    recursive_helper(input_dict)
    return output

input_dict = {"abc":{"def":{"ghi":{"jkl":{"mno":{"pqr":{"stu":{"vwx":{"yz":"you are finally here !!!"}}}}}}}}}
output = convert_dict(input_dict)
print(output)


