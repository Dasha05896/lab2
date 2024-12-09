from flask import Flask
import time
import math

app = Flask(__name__)

def trig_function():
    # Обчислення тригонометричних значень
    values = [math.sin(i) for i in range(1, 10000)]
    values.sort()  # Сортуємо масив
    return values

@app.route('/calculate', methods=['GET'])
def calculate():
    start_time = time.time()
    trig_function()  # викликаємо функцію
    end_time = time.time()
    elapsed_time = end_time - start_time
    return f"Time elapsed: {elapsed_time} seconds"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
