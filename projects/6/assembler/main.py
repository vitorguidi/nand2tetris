import sys, os

def main():
    nr_args = len(sys.argv)
    if nr_args != 3:
        throw(f'Expected 3 arguments, found {nr_args}')
    [path, file] = sys.argv[1:]
    file_path = os.path.join(os.getcwd(), path, file)
    
    code_lines = []
    try:
        file=open(file_path, 'r')
        contents = file.read().replace(' ', '').replace('\t', '').split('\n')
        code_lines = list(
            filter(
                lambda x : x!="" and not (len(x)>=2 and x[0:2]=="//"), 
                contents)
        )
        print(filtered_contents)
    except Exception as e:
        pass
    print(code_lines)

if __name__ == "__main__":
    main()