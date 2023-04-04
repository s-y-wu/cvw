import re

class SoftFloatFunctions():
    def _parse_header_file():
        header_filename = '../../../addins/SoftFloat-3e/source/include/softfloat.h'
        with open(header_filename, 'r') as f:
            content = f.read()

        pattern = r'^(\w+)\s+(\w+)\(([^\)]*)\);'
        functions = {}
        for line in content.splitlines():
            match = re.match(pattern, line.strip())
            if match:
                name = match.group(2)
                inputs = [arg.strip() for arg in match.group(3).split(',')]
                output = match.group(1)
                functions[name] = {'inputs': inputs, 'output': output}
        return functions
    
    dictionary = _parse_header_file()

    @classmethod
    def printall(cls):
        for name, info in SoftFloatFunctions.dictionary.items():
            print(name)
            print('  inputs:', info['inputs'])
            print('  output:', info['output'])

if __name__ == '__main__':
    SoftFloatFunctions.printall()