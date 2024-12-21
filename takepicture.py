import cv2
import os
import time

from datetime import datetime

def capture_and_save_image():
    # Open a connection to the default camera (usually the first camera)
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        print("Error: Could not open video device.")
        return

    # Capture a single frame
    ret, frame = cap.read()

    if ret:
        # Get the current date and time
        current_datetime = datetime.now().strftime("%Y%m%d_%H%M%S")
        # Create a filename with the current date and time
        save_path = f".\images\intruders\captured_image_{current_datetime}.jpg"
        # Save the captured image to the specified path
        cv2.imwrite(save_path, frame)
        print(f"Image saved to {save_path}")

        time.sleep(3)
        # Open the saved image using the default image viewer
        os.system(f"start {save_path}")
    else:
        print("Error: Could not read frame.")

    # Release the camera
    cap.release()

if __name__ == "__main__":
    capture_and_save_image()