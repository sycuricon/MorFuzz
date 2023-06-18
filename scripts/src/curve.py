import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import pyplot as plt
import matplotlib.dates as mdates
import matplotlib.ticker as ticker
import sys
import os

def parse_log(log_name):
    with open(log_name) as file:
        lines = file.readlines()

    time = []
    value = []
    inst = []
    # [CJ] (0) coverage summary 380 (+380),	instruction count 114 (+114),	passed time 0 hours, 0 minutes, 0 seconds, exception_counter 2
    for line in lines:
        if line.startswith('[CJ]'):
            w = line.split(' ')
            if int(w[10]) >= 24:
                break
            time.append(f'2023-01-01 {w[10]}:{w[12]}:{w[14]}')
            value.append(int(w[4]))
            inst.append(int(w[7]))

    data = pd.DataFrame({"time": time, "value": value, "inst": inst})
    data['time'] = pd.to_datetime(data['time'])
    return data

args = sys.argv
cnt = len(args) // 2 - 1
target = args[1]
data = {}
for i in range(1, cnt + 1):
  data[args[2 * i]] = parse_log(args[2 * i + 1])

@ticker.FuncFormatter
def millions(x, pos):
    'The two args are the value and tick position'
    return '%.1fM' % (x * 1e-6)


sns.set(style="whitegrid")
fig, ax = plt.subplots()

#ax.yaxis.set_major_formatter(millions)
ax.set_ylim(ymin=0, ymax=2250000)
ax.set_yticks([0, 250000, 500000, 750000, 1000000, 1250000, 1500000, 1750000, 2000000, 2250000])
ax.set_yticklabels(['0', '0.25M', '0.50M', '0.75M', '1.00M', '1.25M', '1.50M', '1.75M', '2.00M', '2.25M'])

color = ['blue', 'red', 'green', 'brown', 'purple', 'orange', 'pink', 'gray', 'olive', 'cyan']

for key, value in data.items():
    ax.plot(value['time'], value['value'],  label=key, color=color.pop(0))

ax.set_xticks(['2023-01-01 00:00:00', '2023-01-01 04:00:00', '2023-01-01 08:00:00', '2023-01-01 12:00:00', '2023-01-01 16:00:00', '2023-01-01 20:00:00', '2023-01-01 23:59:59'])
ax.set_xticklabels(['0h', '4h', '8h', '12h', '16h', '20h', '24h'])
ax.set_xlim(xmin=mdates.datestr2num('2023-01-01 00:00:00'), xmax=mdates.datestr2num('2023-01-01 23:59:59'))

legend = ax.legend(loc='center right', fontsize='x-large')
plt.xlabel('time')
plt.ylabel('coverage')
fig.set_size_inches(12, 7)
os.makedirs('scripts/output', exist_ok=True)
plt.savefig(f'scripts/output/{target}.pdf', bbox_inches='tight')