import datetime
import time
import os

# Define the schedule (Start Hour, Start Minute, Task Name)
# Must be in chronological order
SCHEDULE = [
    ((0, 0), "Sleep"),
    ((5, 0), "Fajr"),
    ((5, 20), "Web Dev"),
    ((8, 0), "Break"),
    ((8, 20), "App Dev"),
    ((12, 0), "Breakfast"),
    ((12, 30), "Dhuhr"),
    ((13, 0), "Qailulah"),
    ((15, 0), "Admin/Light"),
    ((16, 30), "Asr"),
    ((17, 45), "Maghrib"),
    ((18, 0), "Dinner/Family"),
    ((19, 15), "Isha"),
    ((19, 30), "SEO Learning"),
    ((23, 30), "Sleep"),
]

def get_current_task():
    now = datetime.datetime.now()
    current_time = (now.hour, now.minute)
    
    current_task = "Resting"
    for i in range(len(SCHEDULE)):
        start_time = SCHEDULE[i][0]
        if current_time >= start_time:
            current_task = SCHEDULE[i][1]
        else:
            break
    return current_task

def main():
    # Write to a temp file that Neovim can read
    path = "/tmp/current_task.txt"
    while True:
        task = get_current_task()
        with open(path, "w") as f:
            f.write(task)
        time.sleep(60) # Only updates once a minute (zero CPU impact)

if __name__ == "__main__":
    main()
