class Question1_py:
    def __init__(self, input_dict):
        self.input_dict = input_dict

    def extract_keys(self):
        self.keys_list = []

        def recursive_helper(current_dict):
            for key, value in current_dict.items():
                self.keys_list.append(key)
                if isinstance(value, dict):
                    recursive_helper(value)

        recursive_helper(self.input_dict)
        return self.keys_list

    def final_value(self):
        current_dict = self.input_dict
        while isinstance(current_dict, dict):
            key = next(iter(current_dict))
            current_dict = current_dict[key]
        return current_dict

    def print_dict(self):
        keys_list = self.extract_keys()
        output = {}
        for i, key in enumerate(keys_list):
            if i < len(keys_list) - 1:
                output[key] = keys_list[i+1:]
            else:
                output[key] = [self.final_value()]

        for key, value in output.items():
            print(f'"{key}":', value)


