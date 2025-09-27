from commands import *

for root, dirs, files in OS.walk('..'):
    for file in files:
        path = Path.combine(root, file)

        con = File.read(path)
        for cnt, l in enumerate(Str.nl(con)):
            if "DEPLOYMENT_TARGET" in l:
                print(path)
                print(cnt, l)
print("done")
