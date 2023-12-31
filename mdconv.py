import re, glob

swap = (
  ("TITLE:", "#"),
  ("TOC: on", ""),
  ("=========", "# "),
  ("=======", "## "),
  ("=====", "### "),
  ("===", "#### "),
  ("__", "#### "),
  ("!split", "---"),
 )

for f in glob.glob("*.qmd"):
    # print(f"git mv {f} {f[:-7]}.qmd")
    if f.endswith("test.qmd"): continue
    newfile = ""
    for l in open(f).readlines():
        newline = l
        
        if l.startswith("@@@CODE "):
            newline = l.strip().replace("@@@CODE ", "[Link to the code](") + ")\n"
        if l.startswith("# #include "):
            newline = l.strip().replace('"','').replace("# #include ", "\n[Link to subsection](") + ")\n"    
        if l.startswith("FIGURE: "):
            match = re.search("\[.*,", l)
            path = match.group(0)[1:-1]
            match = re.search("\].* ", l)
            caption = match.group(0)[1:-1]
            newline = f"![{caption}]({path})" + "\n"
            
        for val in swap:
            k, v = val
            if l.startswith(k):
                newline = "\n"+ f"{v}{l.replace(k,'')}" 
                break
                
        if newline.strip().startswith("o "):
            spot = newline.find("o ")
            newline = newline[:spot] + "1. " + newline[spot+2:]
        
        if ('": "') in newline:
            parts = newline.strip().split('"')
            for i, val in enumerate(parts):
                if val == ": ":
                    parts[i] = "]("
                    parts[i-1] = "[" + parts[i-1]
                    parts[i+1] = parts[i+1] + ")"
                    
            newline = "".join(parts) + "\n"
        else: 
            if "http" in newline:
                parts = newline.strip().split(" ")
                for i, part in enumerate(parts):
                    if part.startswith("http"):
                        parts[i] = "<" + part + ">"
                newline = " ".join(parts) + "\n"
        
        
        
        newfile += newline
                
    with open(f[:-3]+"test.qmd", 'w') as outf: 
        outf.write(newfile)