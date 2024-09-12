from os import system
if not system('yasm --version'):
    if filename := input('Enter in your assembly filename: '):
        if not system(f'yasm -g dwarf2 -f elf64 {filename}.asm -l {filename}.lst'):
            print(f'WROTE TO: {filename}.asm\nWROTE TO: {filename}.lst')
            
            if not system(f'ld -g -o {filename} {filename}.o'):
                print(f'LINKED: {filename}.o to {filename}')
                
                if input(f'Would you lik to run {filename}? [Y/n] ').lower() == 'y' :
                    system(f'./{filename}')
                    
            else:
                raise Exception(f'Could not link {filename}.o')
            
        else:
            raise FileNotFoundError('No such file or directory.\nHINT: remove file extension from argument.\nHINT: change directory to where the file is located.')

    else:
        raise FileNotFoundError('No filename specified.')

    if input('Would you like to open DDD (Data Display Debugger)? [Y/n] ').lower() == 'y':
        system(f'ddd {filename}')
        
else:
    if input('yasm was not found, would you like to install it? [Y/n] ').lower() == 'y':
        system('sudo apt install yasm')
    
