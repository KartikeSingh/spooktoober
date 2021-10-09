from pytube import YouTubeimport oswhile True:    try:        path = os.path.join("Downloads")         os.mkdir(path)    except FileExistsError:        pass    try:        YTLINK = input("Please Enter the YouTube Link here: ")        SRC = YouTube(YTLINK)        ys = SRC.streams.get_highest_resolution()        print(f"Downloading the Video {SRC.title} with a length from {SRC.length} Seconds")        ys.download(output_path="Downloads")        print("Downloaded the Video in the Download Folder")        break    except:        print("Retry please")        pafrom pytube import YouTube
import os

while True:
    try:
        path = os.path.join("Downloads") 
        os.mkdir(path)
    except FileExistsError:
        pass
    try:
        YTLINK = input("Please Enter the YouTube Link here: ")
        SRC = YouTube(YTLINK)

        ys = SRC.streams.get_highest_resolution()

        print(f"Downloading the Video {SRC.title} with a length from {SRC.length} Seconds")
        ys.download(output_path="Downloads")
        print("Downloaded the Video in the Download Folder")
        break
    except:
        print("Retry please")
        pass
