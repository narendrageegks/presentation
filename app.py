from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def get_container_info():

    # Get the container ID from the environment (if available)
    container_id = os.getenv("HOSTNAME")

    return {"data":f"Container ID: {container_id} hello"}

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
