Python Script to Send Keystrokes to Two Applications Simultaneously
Automating Keystrokes with Python
Introduction
Automation is a powerful tool that can help streamline repetitive tasks, increase efficiency, and reduce human error. One common form of automation involves sending keystrokes to applications to simulate user input. In this document, we will explore how to create a Python script that can send keystrokes to two applications simultaneously.
Prerequisites
Before we dive into the script, there are a few prerequisites that we need to set up:
•	Python 3.x installed on your machine
•	Packages: `pyautogui`, `pygetwindow`, and `keyboard`
You can install these packages using pip:
pip install pyautogui pygetwindow keyboard
Understanding the Packages
To achieve our goal, we will use three main packages:
•	pyautogui: This package allows us to control the mouse and keyboard, providing functions to simulate keystrokes and mouse movements.
•	pygetwindow: This package helps us identify and manipulate application windows.
•	keyboard: This package lets us handle keyboard events and send keystrokes.
Identifying Application Windows
First, we need to identify the windows of the applications to which we want to send keystrokes. To do this, we can use the `pygetwindow` package. Here is a small script to list all open windows:
import pygetwindow as gw
windows = gw.getAllTitles()
for window in windows:
print(window)
Run this script and note down the titles of the windows you want to interact with.
Sending Keystrokes
Next, we will write a function to send keystrokes to a specific application window using the `pyautogui` package. We need to make sure the window is active before sending keystrokes to it.
import pyautogui
import pygetwindow as gw
import time
def send_keystrokes(window_title, keys):
window = gw.getWindowsWithTitle(window_title)
if len(window) == 0:
print(f"No window found with title: {window_title}")
return
window = window[0]
window.activate()
time.sleep(0.5)  # Give some time for the window to activate
pyautogui.typewrite(keys)
Handling Multiple Windows
Now that we have a function to send keystrokes to a single window, let's modify it to send keystrokes to two windows simultaneously. We will use the `keyboard` package to listen for a trigger key to start sending keystrokes.
import keyboard
def send_keystrokes_to_multiple_windows(window_titles, keys):
if len(window_titles) != 2:
print("This function only supports sending keystrokes to exactly two windows.")
return
windows = [gw.getWindowsWithTitle(title)[0] for title in window_titles]
for window in windows:
if window is None:
print(f"No window found with title: {window_titles[windows.index(window)]}")
return
def send_keys():
for window, key in zip(windows, keys):
window.activate()
time.sleep(0.5)  # Give some time for the window to activate
pyautogui.typewrite(key)
# Listen for the trigger key (e.g., 'ctrl+shift+k')
keyboard.add_hotkey('ctrl+shift+k', send_keys)
print("Press 'ctrl+shift+k' to send keystrokes to the windows.")
# Keep the script running
keyboard.wait('esc')
Full Script
Finally, let's put everything together into a complete script. This script will send predefined keystrokes to two application windows when a specific hotkey is pressed.
import pyautogui
import pygetwindow as gw
import keyboard
import time
def send_keystrokes(window_title, keys):
window = gw.getWindowsWithTitle(window_title)
if len(window) == 0:
print(f"No window found with title: {window_title}")
return
window = window[0]
window.activate()
time.sleep(0.5)  # Give some time for the window to activate
pyautogui.typewrite(keys)
def send_keystrokes_to_multiple_windows(window_titles, keys):
if len(window_titles) != 2:
print("This function only supports sending keystrokes to exactly two windows.")
return
windows = [gw.getWindowsWithTitle(title)[0] for title in window_titles]
for window in windows:
if window is None:
print(f"No window found with title: {window_titles[windows.index(window)]}")
return
def send_keys():
for window, key in zip(windows, keys):
window.activate()
time.sleep(0.5)  # Give some time for the window to activate
pyautogui.typewrite(key)
# Listen for the trigger key (e.g., 'ctrl+shift+k')
keyboard.add_hotkey('ctrl+shift+k', send_keys)
print("Press 'ctrl+shift+k' to send keystrokes to the windows.")
# Keep the script running
keyboard.wait('esc')
if __name__ == "__main__":
window_titles = ["Application Window 1", "Application Window 2"]
keys = ["Hello, World!", "Goodbye, World!"]
send_keystrokes_to_multiple_windows(window_titles, keys)
Conclusion
This script provides a simple yet effective way to send keystrokes to two applications simultaneously. By leveraging the capabilities of `pyautogui`, `pygetwindow`, and `keyboard` packages, we can automate tasks across multiple applications with ease. With further customization, this script can be adapted to meet specific needs and workflows.

