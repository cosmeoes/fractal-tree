import tkinter
import sys
with open("output") as f:
    content = f.readlines()

master = tkinter.Tk()
width = 1600
height = 900
frameRate=0
w = tkinter.Canvas(master, width=width, height=height)
w.configure(background='black')
w.pack()
pos = 0

if len(sys.argv) > 1 and sys.argv[1] == "-d":
    frameRate =1

def draw_next():
    global pos
    if pos < len(content):
        line = content[pos]
        coords = line.split(',')
        w.create_line(width//2+int(coords[0]), height - int(coords[1]), width//2+int(coords[2]), height  - int(coords[3]), fill="white")
        pos+=1
        w.after(frameRate, draw_next)

w.after(frameRate, draw_next)
tkinter.mainloop()
