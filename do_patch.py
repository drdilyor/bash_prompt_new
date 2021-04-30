import re
import os

pattern = re.compile('(\s*)context.prompt =.*')
directory = os.environ['directory']

def patch_init():
    file = f'{directory}/venv/__init__.py'
    with open(file) as f:
        lines = f.read().split('\n')

    print(file, len(lines))
    for i, line in enumerate(lines):
        match = pattern.match(line)
        if match:
            new_line = match.group(1)+'context.prompt = prompt #'
            lines = lines[:i+1] + [new_line] + lines[i+1:]
            print(new_line)
            with open(file, 'w') as f:
                f.write('\n'.join(lines))
            break
    else:
        print(f"no match for {file}")

def patch_activate():
    file = f'{directory}/venv/scripts/common/activate'
    with open(file, 'a') as f:
        f.write('\nVENV_PROMPT="__VENV_PROMPT__" #\n')

patch_init()
patch_activate()
