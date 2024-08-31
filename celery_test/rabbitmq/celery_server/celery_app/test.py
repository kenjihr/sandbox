from tasks import calc_bmi
import time
res = calc_bmi.delay(50,100)

while not res.ready():
    print("wait")
    time.sleep(1)

print(f"result={res.get()}")